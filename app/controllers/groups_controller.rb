class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy]

  def new
    @group = Group.new
    @group.users << current_user
    # @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, success: "Success create a「#{group_params[:name]}」"
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to group_chats_path(@group), success:"Success change to「#{@group.name}」"
    else
      render :edit
    end
  end

  def destroy
    group_name = @group.name
    if @group.destroy
      redirect_to root_path, warning:"Success destroy a 「#{group_name}」"
    else
      redirect_to root_path, danger:"Failed destroy a 「#{group_name}」"
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids:[]})
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
