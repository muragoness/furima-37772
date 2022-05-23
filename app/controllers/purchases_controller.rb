class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
   
    params.require(:purchase_address).permit(:postal_code, :prefectures_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end


end



