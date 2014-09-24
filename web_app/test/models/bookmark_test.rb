# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  url_id     :integer
#  note       :string(255)
#  title      :string(255)
#  send_to    :string(255)
#  image_url  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
