# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/new_user
  def new_user
    MessageMailer.new_user
  end

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/not_active_user
  def not_active_user
    MessageMailer.not_active_user
  end

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/main
  def main
    MessageMailer.main
  end

end
