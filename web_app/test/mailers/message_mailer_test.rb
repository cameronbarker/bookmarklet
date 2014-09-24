require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "new_user" do
    mail = MessageMailer.new_user
    assert_equal "New user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "not_active_user" do
    mail = MessageMailer.not_active_user
    assert_equal "Not active user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "main" do
    mail = MessageMailer.main
    assert_equal "Main", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
