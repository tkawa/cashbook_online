class CategoriesController < ApplicationController
  def index
  end

  def new
    @category = Category.new
  end

  def create
    permitted_params = params.require(:category).permit(:name)
    @category = current_user.categories.new(permitted_params)
    if @category.save 
      redirect_to items_path
    else
      render 'new'
    end
  end

  def destory
    @category = current_user.categories.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
end
