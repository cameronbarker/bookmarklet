json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :id, :user_id, :group_id, :url_id
  json.url bookmark_url(bookmark, format: :json)
end
