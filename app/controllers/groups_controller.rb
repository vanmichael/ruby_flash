class GroupsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_group, only: [:show, :edit, :update, :destroy, :import]

	def index
		@groups = Group.search(params[:search]).order(sort_column + " " + sort_direction)
	end

	def new
		@group = Group.new
		@groups = Group.search(params[:search]).order(sort_column + " " + sort_direction)
	end

	def create
		@groups = Group.search(params[:search]).order(sort_column + " " + sort_direction)
		@group = current_user.groups.build(group_params)
			if @group.add
				redirect_to new_my_group_path, notice: 'Group created!'
			else
				render 'new', notice: 'Group Not Created!'
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

	def import
		file = params[:file]
		error = Card.add_cards_from_file(@group, file)

		if error.nil?
			flash[:notice] = "Cards Added From CSV Successfully!"
		else
			flash[:alert] = error
		end

		redirect_to @group
		# file = params[:file].tempfile
		# if params[:file].original_filename.split('.')[1] == 'csv'
		# 	if Card.add_cards_from_file(@group, file)
		# 		redirect_to :back, notice: "Cards Added From CSV Successfully!"
		# 	else
		# 		redirect_to :back, notice: "Cards Not Added From CSV!"
		# 	end
		# else
		# 	redirect_to :back, notice: "Cards Not Added: must be a .csv file type!"
		# end
	end

	private

	def set_group
		@group = Group.find(params[:id])
	end

	def group_params
		params.require(:group).permit(:name)
	end

	def sort_column
		Group.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end

end
