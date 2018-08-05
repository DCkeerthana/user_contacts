class HomesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	#load_and_authorize_resource

	def index
		@users = User.all
	end


	# def new
	# 	@user = User.new
		
	# end


	# def create
	# 	@user = User.new(params[:user].permit(user_params))
	# 	if @user.save
	# 		redirect_to user_path(@user.id), notice: "the user was sucessfully created"
	# 	else
	# 		render action: 'new'
	# 	end
	# end

	# def edit
	# 	@user = User.find(params[:id])
		
	# end
	
	# def update
	# 	@user = User.find(params[:id])
	# 	if @user.update_attributes(user_params)
	# 		redirect_to user_path(@user.id), notice: "the user was sucessfully updated"
	# 	else
	# 		render action: 'edit'
	# 	end
		
	# end

	def show
		@user = User.find(params[:id])
		
	end

	def user_params
		params.require[:user].permit(:user_name,:email,:mobile,:contact_id)
	end
 end