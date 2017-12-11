class ContactMailer < ApplicationMailer

  def send_contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(from: @email, to: 'pretium-test@test.com', subject: "Contact Request", body: @message)
  end

end
