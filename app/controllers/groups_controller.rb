class GroupsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_group, only: [:show, :edit, :update, :destroy, :join]

	def index
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)

		respond_to do |format|
			if @group.add
				format.html { redirect_to new_group_path, notice: 'Group created!' }
			else
				format.html { render action: 'new', notice: 'Group Not Created!' }
			end
		end
	end

	def show
		@card = Card.new
	end

	def edit

	end

	def update
		@group = Group.find(params[:id])
	end

	def destroy
		@group.destroy
		respond_to do |format|
			format.html { redirect_to groups_url }
		end
	end

	#Custom Actions

	def join
		@membership = Membership.new(user_id: current_user[:id], group_id: params[:id])
		@membership.save
		redirect_to @group
	end

	private

	def set_group
		@group = Group.find(params[:id])
	end

	def group_params
		params.require(:group).permit(:name)
	end
end
