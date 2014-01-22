class MyGroupsController < ApplicationController

  def index
    @my_groups = current_user.groups
  end

  def new
    @my_groups = current_user.groups
    @my_group = Group.new
  end

  def create
    @my_group = Group.new(group_params)
  end

  private

  def my_group_params

  end

end
