class ItemsController < ApplicationController
  before_action :set_items, only: [:index, :create]

  def index
		@item = Item.new
	end

  def create
		permitted_params = params.require(:item).permit(:name, :money, :category_id, :purchased_at)
		@item = current_user.items.new(permitted_params)
		if @item.save
			redirect_to items_path
		else
			render 'index'
		end
  end

  def destroy
		@item = current_user.items.find(params[:id])
		@item.destroy
		redirect_to items_path
  end

  private
  def set_items
		@items = current_user.items.includes(:category).order('purchased_at DESC')
  end
end
