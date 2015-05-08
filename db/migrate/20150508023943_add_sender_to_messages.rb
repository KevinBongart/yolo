class AddSenderToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :sender, index: true, foreign_key: true
  end
end
