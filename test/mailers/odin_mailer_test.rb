require "test_helper"

class OdinMailerTest < ActionMailer::TestCase
  test "new_welcome_email" do
    mail = OdinMailer.new_welcome_email
    assert_equal "New welcome email", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
