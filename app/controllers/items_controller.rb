class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
     @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def show
  # end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :delivery_charge_id, :prefectures_id,
                                 :days_for_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
