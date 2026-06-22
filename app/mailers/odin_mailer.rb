class OdinMailer < ApplicationMailer
  default from: "no-reply@odinbook.com"

  def new_welcome_email(user)
    @user = user

    mail(
      to: @user.email,
      subject: "Welcome to Odinbook!"
    )
  end
end