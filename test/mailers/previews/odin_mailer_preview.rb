# Preview all emails at http://localhost:3000/rails/mailers/odin_mailer
class OdinMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/odin_mailer/new_welcome_email
  def new_welcome_email
    user = User.first || User.new(email: "test@example.com", user_name: "testuser")

    OdinMailer.new_welcome_email(user)
  end
end
