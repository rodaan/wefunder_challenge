class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def test_email
    puts('sending...')
    mail(to: 'rodaan.rabang@gmail.com', subject: 'This is a test email')
  end
end
