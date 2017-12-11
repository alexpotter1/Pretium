class ContactMailer < ApplicationMailer

  def send_contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(from: @email, subject: "Contact Request")
  end

end
