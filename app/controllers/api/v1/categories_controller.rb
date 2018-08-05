class Api::V1::CategoriesController < Api::V1::ApiController
	def index
		@categories = Category.all
        render json: @categories
	end


	def create
		@category = Category.new(category_params)
		if @category.save
			render json: @category 
		else
			render json: { errors: @category.errors.full_messages, reason: "validation failed"} # error in saving, return as a hash (json)
		end
	end
	#get - localhost:3000/api/v1/categorys/:id
	def show
		@category = Category.find(params[:id])
		render json: @category 
	end
	#patch - localhost:3000/api/v1/categorys/:id
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			render json: {
				notice: "Successfully updated the category",
				category: @category
			}
		else
			render json: {
				errors: @category.errors.full_messages,
				reason: "validation failed"
			}
		end
	end
	#delete - localhost:3000/api/v1/categorys/:id
	def destroy
		@category = Catefgory.find(params[:id])
		@category.destroy
		render json: {
			notice: "Successfully deleted the category",
			category: {
				id: @category.id,
				name: @category.name
			} 
		}
	end

	private
	def category_params
		params[:category].permit(:name)
	end
end