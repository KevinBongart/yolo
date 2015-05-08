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

  private

  def sender_params
    params.require(:sender).permit(:uid)
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
