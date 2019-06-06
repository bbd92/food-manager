class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_categories, only: [:index, :new]
  
  def index
    @bad_foods = Food.where("expiration_date < ?", DateTime.now).destroy_all
    @foods = Food.where(user_id: current_user.id).order("expiration_date")
  end
  
  def new
    @food = Food.new
    @category = Category.all.map{|category| [category.name, category.id]}
    @default_expiration_date = Date.current.since(set_provisional_expiration_date.days)
  end

  def create
    if Food.create(food_params)
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group), notice: '食品を登録しました' }
        format.json
      end
    end
  end

  def update
    @food = Food.find(params[:id])
    @quantity = @food.quantity - 1
    @food.update(quantity: @quantity)
    redirect_to action: :index
  end

  def destroy
    Food.find(params[:id]).destroy
    redirect_to action: :index
  end

  private
  def food_params
    params.require(:food).permit(:name, :category_id, :quantity, :expiration_date, :id).merge(user_id: current_user.id)
  end

  def set_categories
    @categories = Category.where(user_id: current_user.id)
  end

  def set_provisional_expiration_date
    @provisional_expiration_date = User.find(current_user.id).provisional_expiration_date
  end
end
