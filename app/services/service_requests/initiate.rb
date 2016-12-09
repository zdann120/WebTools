class ServiceRequests::Initiate < ActiveInteraction::Base
  object :user
  string :subject
  string :message

  def execute
    sr = user.service_requests.new(
      subject: subject,
      message: message,
      user: user
    )
    if sr.save
      sr
    else
      errors.add(sr, 'could not be saved')
    end
  end
end
