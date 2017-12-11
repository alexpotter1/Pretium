class ContactController < ApplicationController

  def index
  end

  def submit
    name = params[:name]
    email = params[:email]
    comment = params[:message]

    # Pass obtained parameters straight to the mailer
    ContactMailer.send_contact_email(name, email, comment).deliver
    redirect_to bitcoin_index_path, notice: "Successfully sent contact message"
  end

end
