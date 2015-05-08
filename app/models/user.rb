class User < ActiveRecord::Base
  has_many :messages_sent,     class_name: "Message", foreign_key: :sender_id
  has_many :messages_received, class_name: "Message", foreign_key: :recipient_id
end
