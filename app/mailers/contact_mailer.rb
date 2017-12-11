class ContactMailer < ApplicationMailer

  def send_contact_email(contact_inquiry)
    @contact_inquiry = contact_inquiry
    mail(to: @contact_inquiry.email, subject: "Pretium: Thanks for getting in touch")
  end

end
