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

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
