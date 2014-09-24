class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :access]

  def index
    @groups = Group.all
  end

  def show
    if(@group.locked?)
      @locked = true
    else
      @bookmarks = @group.bookmarks
    end
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)

    if current_user.present?
      @group.used_id = current_user.id
    else
      @group.user_id = 1
    end

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #Used for ajax validation on show page
  #Checks if user has access
  def access
    user = User.find(1)
    if(user.has_access(params[:pin], @group.id))
      @access = true
      @bookmarks = @group.bookmarks
      render :layout => false
    else
      @access = false
      render :layout => false
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:user_id, :title, :locked)
    end
end
