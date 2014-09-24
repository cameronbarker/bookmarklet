module Api
  module V1
    class SessionsController < ApplicationController
      protect_from_forgery except: :create
      respond_to :json

      def create
        users = User.authenticate sessions_params[:email], sessions_params[:password]

        if users
          render :json => {:status => :ok, :access_token => users.access_token, :uuid => users.uuid}
        else
          head :unauthorized
        end
      end

      private
        def sessions_params
          params.require(:session).permit(:email, :password)
        end
    end
  end
end
