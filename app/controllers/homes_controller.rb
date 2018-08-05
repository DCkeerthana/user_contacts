class HomesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@users = User.all
	end


	

	def show
		@user = User.find(params[:id])
		
	end

	def user_params
		params.require[:user].permit(:user_name,:email,:mobile,:contact_id)
	end
 end