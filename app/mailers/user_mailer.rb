class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = new_user_session_url
    mail(to: @user.email, subject: 'Welcome to Anecdotal Notes!')
  end
end
