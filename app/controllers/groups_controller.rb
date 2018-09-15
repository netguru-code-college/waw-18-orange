class GroupsController < ApplicationController
  def index
    current_user.joined_groups.all
  end

  def show
  end
  
end
