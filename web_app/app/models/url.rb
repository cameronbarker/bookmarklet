# == Schema Information
#
# Table name: urls
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Url < ActiveRecord::Base
  has_many :bookmarks
  has_many :groups, through: :bookmarks
  has_many :users, through: :bookmarks

  #adding the tags!
  acts_as_taggable

  #get base data
  def get_page(url)
    parsed_page = MetaInspector.new(url)

     if parsed_page.try(:title)
       title = parsed_page.title.strip
     end

     if parsed_page.meta.has_key?("og:image")
       image = parsed_page.meta["og:image"]
     end

     if parsed_page.meta.has_key?("description")
       description = parsed_page.meta["description"]
     end

     if parsed_page.meta.has_key?("keywords")
       keywords = parsed_page.meta["keywords"]
     end


    {
      url: url,
      title: title,
      description: description,
      keywords: keywords,
      image: image,
    }
  end

  #get extra images so I can choose the one I want
  def get_secondary_images(url)
    get_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(get_page.body)

    images = parsed_page.css('img').map{ |i| [i['src'], FastImage.size(i['src'])]}
    images = images.select{|i| !i[1].nil?}
    images = images.map{|i| [i[0], i[1].sum]}
    images = images.sort_by(&:last).reverse
  end

end
