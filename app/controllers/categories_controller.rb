class CategoriesController < ApplicationController
load_and_authorize_resource
	
	def index
		# binding.pry
		@categories = Category.all
		# binding.pry
	end
	


	def new
		@category = Category.new
		
	end

# binding.pry
	def create
		@category = Category.new(params[:category].permit(:name))
		
		if @category.save
			# binding.pry
			redirect_to category_path(@category.id), notice: "the catrgory was sucessfully created"
		else
			render action: 'new'
		end
		# binding.pry
	end
	

	def edit
		@category = Category.find(params[:id])
		
	end
	
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			redirect_to category_path(@category.id), notice: "the category was sucessfully updated"
		else
			render action: 'edit'
		end
		
	end

	def show
		@category = Category.find(params[:id])
		@contacts =  @category.contacts_list(current_user)
		
	end
	def destroy
			@category =Category.find(params[:id])
			@category.destroy
			redirect_to contact_path, notice: "the category was sucessfully deleted" 
		end

	def category_params
		params[:category].permit(:name)
	end
end
