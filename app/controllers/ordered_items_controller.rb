class OrderedItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @last_order = Order.where(user: current_user).last
    if @last_order.status != "pending"
      @last_order = Order.create(user: current_user)
    end
    @dish_ordered = Dish.find(ordered_item_params[:dish_id])
    @ordered_item = OrderedItem.create(order: @last_order, dish: @dish_ordered)

    if @ordered_item.save
      redirect_to dishes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @ordered_item = OrderedItem.find(params[:id])
    @ordered_item.destroy
    redirect_to orders_path, notice: "Le plat a été décommandé avec succès."
  end

  private

  def ordered_item_params
    params.require(:ordered_item).permit(:dish_id)
  end
end
