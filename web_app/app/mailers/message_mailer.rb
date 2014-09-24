class MessageMailer < ActionMailer::Base
  default from: "from@example.com"
  def share_link#(from, to, status, bookmark)
    # @greeting = "Hi"
    # @status = status
    # @bookmark = bookmark

    mail to: "barker.cameron@gmail.com", from: "barker.cameron@gmail.com", subject: "Need a Subject Line"
  end
end
