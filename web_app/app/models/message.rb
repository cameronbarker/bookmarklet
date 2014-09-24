# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  email       :string(255)
#  opened      :boolean
#  opened_at   :datetime
#  clicked     :boolean
#  clicked_at  :datetime
#  bookmark_id :integer
#  send_from   :integer
#  send_to     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Message < ActiveRecord::Base
  belongs_to :bookmark

  def create_send_through(current_user, to, bookmark)
    #when sending mail the priority is to make it easy and appealing to click the link

    from = current_user
    to = User.where(email: to).first_or_initialize

    if to.new_record?
      to.password = SecureRandom.hex(8)
      to.save
      MessageMailer.new_user(from.email, to.email, "new user", bookmark)

      #send message letting them know that from sent you this from a simple to use program
      #the claim your account will lead them to reset their password and then sign in
    elsif to.sign_in_count === 0
      #send message with bottom that says claim your account at the bottom
      #the claim your account will lead them to reset their password and then sign in
      #short walk through of the program would be awesome
      MessageMailer.new_user(from.email, to.email, "unclaimed user", bookmark)
    else
      #send message saying they recieved the message
      MessageMailer.new_user(from.email, to.email, "exisiting user", bookmark)
    end
  end
end
