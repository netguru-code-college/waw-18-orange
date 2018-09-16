class GroupsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
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
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
    redirect_to @post, notice: "Your post was edited successfully"
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: "Your post was deleted"
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, memberships_attributes: [:id] )
  end

  def set_group
    @post = Group.find(params[:id])
  end

end
