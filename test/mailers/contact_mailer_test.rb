require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

  def setup
    @name = 'test1'
    @email_from = 'test@test.com'
    @message = 'a comment'

    @email = ContactMailer.send_contact_email(@name, @email_from, @message).deliver_now
  end

  test 'send email test' do
    assert_not ActionMailer::Base.deliveries.empty?
  end

  test 'check from test' do
    assert_equal @email_from, @email.from[0]
  end

  test 'check to test' do
    assert_equal "pretium-test@test.com", @email.to[0]
  end

  test 'check email message content test' do
    # no ketchup, just sauce, raw sauce
    assert_equal @message, @email.body.raw_source
  end
end
