class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @joined_groups = current_user.joined_groups
    @owned_groups = current_user.owned_groups
  end

  def new
    @group = Group.new
    @group.members.build
  end

  def create
    @group = Group.new(group_params)
    @group.organizers << current_user
    @group.members << current_user
    create_payments
    if @group.save
      redirect_to @group, notice: 'Your group was created successfully'
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
    redirect_to @group, notice: 'Your group was edited successfully'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: 'Your post was deleted'
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :amount, member_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def create_payments
    @group.members.each do |member|
      Payment.create(user: member, group: @group, amount: @group.amount)
    end
  end

end
