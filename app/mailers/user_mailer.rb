class UserMailer < ActionMailer::Base
  default from: "Cookie Monster <jeff@starterleague.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @name = user.name

    mail to: "to@example.org"
  end
end
