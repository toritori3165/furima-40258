class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
    @category = Category.all
    @condition = Condition.all
    @shipping_fee = ShippingFee.all
    @area = Area.all
    @shipping_to_date = ShippingToDate.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :content, :category_id, :condition_id, :shipping_fee_id, :area_id, :shipping_to_date_id, :price, :image ).merge(user_id: current_user.id)
  end
end
