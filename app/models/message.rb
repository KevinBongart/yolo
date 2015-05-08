class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  after_create :dispatch

  def dispatch
    return if recipient.present?

    update(recipient: User.order_by_rand.first)
  end
end
