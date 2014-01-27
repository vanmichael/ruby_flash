class MyGroupsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @my_groups = current_user.groups
  end

  def new
    @my_groups = current_user.groups
    @my_group = Group.new
  end

end
