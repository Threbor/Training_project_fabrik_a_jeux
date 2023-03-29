class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def update
    @order = Order.find(set_order[:order_id])
    if @order.update(status: set_order[:status])
      redirect_to orders_path
    else
      render :index
    end
  end

  private

  def set_order
    params.require(:order).permit(:order_id, :status)
  end
end
