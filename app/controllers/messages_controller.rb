class MessagesController < ApplicationController
  def create
    sender = User.where(sender_params).first_or_create
    @message = sender.messages_sent.new(message_params)

    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def reply
    parent_message = Message.find(params[:message_id])
    sender = User.find_by_uid(sender_params[:uid])

    if parent_message.recipient == sender
      reply_params = message_params.merge(recipient: parent_message.sender)
      @message = sender.messages_sent.new(reply_params)

      if @message.save
        render json: @message, status: :created
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def sender_params
    params.require(:sender).permit(:uid)
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
