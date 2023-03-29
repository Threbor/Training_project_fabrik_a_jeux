class DishesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @dishes = Dish.all
    @assiette_sale_dishes = Dish.joins(:tags).where(tags: { title: ["salé", "les_assiettes"] }).group("dishes.id").having("COUNT(DISTINCT tags.id) = 2")
    @assiette_sucre_dishes = Dish.joins(:tags).where(tags: { title: ["sucré", "les_assiettes"] }).group("dishes.id").having("COUNT(DISTINCT tags.id) = 2")
    @assiette_plat_dishes = Dish.joins(:tags).where(tags: { title: ["plat", "les_assiettes"] }).group("dishes.id").having("COUNT(DISTINCT tags.id) = 2")
    @assiette_dessert_dishes = Dish.joins(:tags).where(tags: { title: ["dessert", "les_assiettes"] }).group("dishes.id").having("COUNT(DISTINCT tags.id) = 2")
    @soft_dishes = Dish.joins(:tags).where(tags: { title: ["soft"] }).group("dishes.id").having("COUNT(DISTINCT tags.id) = 1")
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to dish_path(@dish)
    else
      render :new
    end
  end

  def edit
    @dish = Dish.find(params[:id])

  end

  def update
    @dish = Dish.find(params[:id])

    if @dish.update(dish_params)
      redirect_to @dish, notice: "L'élément a été mis à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @dish = Dish.find(params[:id])
    @joined_ordered_items = OrderedItem.where(dish: @dish)
    @joined_join_dishes_tags = JoinDishesTag.where(dish: @dish)
    @joined_ordered_items.destroy_all
    @joined_join_dishes_tags.destroy_all
    @dish.destroy
    redirect_to dishes_path, notice: "Le plat a été supprimé avec succès."
  end

  private

  def dish_params
    params.require(:dish).permit(:title, :price, :description, :photo)
  end
end
