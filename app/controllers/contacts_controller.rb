class ContactsController < ApplicationController
	load_and_authorize_resource
	def index
		@contacts = Contact.all
		
	end
	def new
		@contact = Contact.new
		
	end

	def create
		@contact = Contact.new(contact_params)
		@contact.user_id = current_user.id
		if @contact.save
			redirect_to contact_path(@contact.id), notice: "the contact was sucessfully created"
			
		else 
			render action: 'new'
		end
	end

		def show
			@contact = Contact.find(params[:id])

		end

		def edit
			@contact = Contact.find(params[:id])
		end 

		def update
			@contact = Contact.find(params[:id])
			if @contact.update_attributes(contact_params)
				redirect_to contact_path(@contact.id)
			else
				render action: "edit"
			end
		end

		def destroy
			@contact =Contact.find(params[:id])
			@contact.destroy
			redirect_to contacts_path, notice: "the contact was sucessfully deleted" 
		end

		def contact_params
		params.require(:contact).permit(:name,:email,:mobile,:category_id,:user_id)
	    end

	    

end

