class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
end
