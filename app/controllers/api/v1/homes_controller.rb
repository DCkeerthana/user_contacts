class Api::V1::HomesController < Api::V1::ApiController
	def index
    @users = User.all
    render json: @users
    end

    def create
		@user = User.new(user_params)
		if @user.save
			render json: @user 
		else
			render json: { errors: @user.errors.full_messages, reason: "validation failed"} # error in saving, return as a hash (json)
		end
	end
	
	def show
		@user = User.find(params[:id])
		render json: {
			id: @user.id,
			name: @user.user_name,
			mobile: @user.mobile,
			email: @user.email,
			contacts_count: @user.contacts.count,
		    contacts: @user.contacts
		}


	end
	
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			render json: {
				notice: "Successfully updated the user",
				user: @user
			}
		else
			render json: {
				errors: @user.errors.full_messages,
				reason: "validation failed"
			}
		end
	end
	
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		render json: {
			notice: "Successfully deleted the user",
			user: {
				id: @user.id,
				name: @user.name
			} 
		}
	end

	private
	def user_params
		params[:user].permit(:name, :email, :company)
	end
end