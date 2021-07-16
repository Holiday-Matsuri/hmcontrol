class UserMailer < ApplicationMailer

  def user_creation(user)
    @user = user
    mail(to: @user.email, subject: "Thank you for Registering for the Holiday Matsuri Panel")
  end
  
end
