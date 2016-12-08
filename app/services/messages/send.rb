class Messages::Send < ActiveInteraction::Base
  object :initiator, class: User
  object :recipient, class: User
  string :subject
  string :message
  boolean :important, default: false

  def execute
    msg = Message.new(
      sender_id: initiator.id,
      recipient_id: recipient.id,
      subject: subject,
      message: message,
      important: important
    )
    if msg.save
      msg
    else
      errors.add(msg, 'could not be added')
    end
  end
end
