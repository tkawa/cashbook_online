class CategoriesController < ApplicationController
  def index
  end

  def new
    @category = Category.new
  end

  def create
    permitted_params = params.require(:category).permit(:name)
    @category = Category.new(permitted_params)
    if @category.save 
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def destory
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
end
