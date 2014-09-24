# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  locked     :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks
  has_many :urls, through: :bookmarks

end
