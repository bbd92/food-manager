class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  
  def create
    Category.create(name:category_params[:name], user_id:current_user.id)
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
