class Api::V1::ContactsController < Api::V1::ApiController
	def index
    @contacts = Contact.all
    render json: @contacts
    end

 def create
		@contact = Contact.new(contact_params)
		if @contact.save
			render json: @contact 
		else
			render json: { errors: @contact.errors.full_messages, reason: "validation failed"} # error in saving, return as a hash (json)
		end
	end
	
	def show
		@contact = Contact.find(params[:id])
		render json: @contact 
	end
	
	def update
		@contact = Contact.find(params[:id])
		if @contact.update_attributes(contact_params)
			render json: {
				notice: "Successfully updated the contact",
				contact: @contact
			}
		else
			render json: {
				errors: @contact.errors.full_messages,
				reason: "validation failed"
			}
		end
	end
	
	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		render json: {
			notice: "Successfully deleted the contact",
			contact: {
				id: @contact.id,
				name: @contact.name
			} 
		}
	end

	private
	def contact_params
		params[:contact].permit(:name, :email, :mobile,:category_id)
	end
end