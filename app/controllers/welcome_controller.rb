class WelcomeController < ApplicationController
  def testemail
    UserMailer.test_email().deliver_later
    puts('email sent')
  end
end
