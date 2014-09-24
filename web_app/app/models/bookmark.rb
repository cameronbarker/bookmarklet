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

class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :url
  has_many :messages

  #adding the tags!
  acts_as_taggable


  def self.create_bookmark(params, current_user)
    bookmark = Bookmark.new

    #link user
    bookmark.user_id = 1

    #add title
    bookmark.title = params[:title]

    #build url
    url = Url.where(url: params[:url]).first_or_create
    bookmark.url_id = url.id

    #add to/create group
    locked = params[:locked].downcase == 'true' #format locked into boolean
    group = Group.where(user_id: 1, title: params[:group], locked: locked).first_or_create
    bookmark.group_id = group.id

    #add image
    bookmark.image_url = params[:image]

    #add note
    bookmark.note = params[:note]

    #add tags
    bookmark.tag_list.add(params[:tags])
      #saving tags to url as well for future stuff
      url.tag_list.add(params[:tags])
      url.save

    #add sendTo
    bookmark.send_to = params[:sendTo]


    #Send the message
    emails = params[:sendto].split(",")

    #remember
    10.times do
      puts "finalize notification email in bookmark send to friends"
    end
    # emails.each do |email|
    #   email = email.strip
    #   Message.create_send_through(email.strip, current_user.id, bookmark)
    # end

    #return the object for the respond with block
    if bookmark.save
      return bookmark
    else
      return error = []
    end
  end


end
