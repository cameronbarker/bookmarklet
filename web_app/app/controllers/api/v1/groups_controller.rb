module Api
  module V1
    class GroupsController < ApplicationController
      # before_action :set_bookmark, only: [:show, :edit]
      # protect_from_forgery except: :create
      respond_to :json

      def index
        #current_user.groups.all
        respond_with Group.all
      end

      # def show
      #   respond_with @group
      # end

      # def create
      #   respond_with Group.create(bookmark_params)
      # end

      # def update
      #   respond_with @bookmark.update(bookmark_params)
      # end
      #
      # def destroy
      #   respond_with @bookmark.destroy(params[:id])
      # end

      private
        def set_bookmark
          @group = Group.find(params[:id])
        end

        def bookmark_params
          binding.pry
          params.require(:group).permit(:user_id, :group_id, :url_id)
        end
    end
  end
end
