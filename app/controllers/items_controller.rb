class ItemsController < ApplicationController
  def index
		@item_new = Item.new
		@item = Item.includes(:category).all
	end
#  def new
#		@item = Item.new
#  end

  def create
		permitted_params = params.require(:item).permit(:name, :money, :category_id, :purchased_at)
		@item = Item.new(permitted_params)
		if @item.save
			redirect_to items_path
		else
			render 'new'
		end
  end

  def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_path
  end
end
