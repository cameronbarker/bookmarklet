module Api
  module V1
    class BookmarksController < ApplicationController
      protect_from_forgery except: :create
      before_filter :authenticate
      # before_filter :current_user
      respond_to :json

      def create
        current_user = User.find_by_uuid(bookmark_params[:uuid])
        respond_with Bookmark.create_bookmark(bookmark_params, current_user)
      end

      private
        def bookmark_params
          params.require(:bookmark).permit(:title, :url, :group, :locked, :image,
                                            :note, :tags, :sendto, :access_token, :uuid)
        end

        #http://blog.envylabs.com/post/75521798481/token-based-authentication-in-rails
        def authenticate
          authenticate_token || render_unauthorized
        end

        def authenticate_token
          authenticate_with_http_token do |token, options|
            User.find_by(access_token: token)
          end
        end

        def render_unauthorized
          self.headers['WWW-Authenticate'] = 'Token realm="Application"'
          render json: 'Bad credentials', status: 401
        end

    end
  end
end
