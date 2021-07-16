class EventApplicationMailer < ApplicationMailer
  def created_event_application(panel, user)
    @user = user
    @panel = panel
    @convention = Convention.active.first
    mail(to: @user.email, subject: "Thank you for submitting your application.")
  end
  
end
