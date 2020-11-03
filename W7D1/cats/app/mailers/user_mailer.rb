class UserMailer < ApplicationMailer
  default from: "jason.huaiyiwang@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/login"
    mail(to: user.username, subject: "Welcome!")
  end
end
