class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    @group.memberhips.build
  end

  def create
    @group = Group.new(group_params)
    @group.ownerships << current_user
    if @group.save
      redirect_to @group, notice: "Your group was created successfully"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @group.update(post_params)
    redirect_to @group, notice: "Your group was edited successfully"
    else
      render :edit
    end
  end

  def destroy
    @group.delete
    redirect_to groups_path, notice: "Your post was deleted"
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, memberships_attributes: [:id] )
  end

  def set_group
    @group = Group.find(params[:id])
  end

end