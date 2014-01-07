class NewGroupConfirmation < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_group_confirmation.notification.subject
  #
  def notification(group)
    @group = group
    
    @greeting = "Hi"

    mail to: "to@example.org",
      subject: "Group Creation Confirmed"
  end
end
