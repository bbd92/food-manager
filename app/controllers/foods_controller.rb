class FoodsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bad_foods = Food.where("expiration_date < ?", DateTime.now).destroy_all
    @foods = Food.where(user_id: current_user.id).order("expiration_date")
  end
  
  def new
    @food = Food.new
  end

  def create
    @created_foods = []
    separated_by_line = food_params[:name].split(/\n+|\r\n+|\r+/)
    separated_by_line.each do |data|
      data.match(/[0-9]{1,2}月[0-9]{1,2}日/)
      finished_params = {}
      finished_params[:name] = $`
      finished_params[:expiration_date] = Date.strptime("#{$&}","%m月%d日")
      finished_params[:quantity] = $'
      finished_params[:user_id] = current_user.id
      finished_params[:category] = "その他"
      Vegitable.all.each do |food|
        if food.name == $`
          finished_params[:category] = "青果"
        end
      end
      MeatAndFish.all.each do |food|
        if food.name == $`
          finished_params[:category] = "肉魚"
        end
      end
      @food = Food.new(finished_params)
      @food.save!
      @created_foods << @food
    end
  end

  def vegitables
    @vegitables = Food.where(category: "青果").order("expiration_date")
  end

  def meats_and_fishes
    @meats_and_fishes = Food.where(category: "肉魚").order("expiration_date")
  end

  def others
    @others = Food.where(category: "その他").order("expiration_date")
  end

  def how_to_use
  end

  def update
    @food = Food.find(params[:id])
    @quantity = @food.quantity - 1
    if @food.update(quantity: @quantity)
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  def destroy
    Food.find(params[:id]).destroy
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def food_params
    params.require(:food).permit(:name)
  end

  def separate_data_by_line(data)
    binding.pry
    separated_by_line = data.split(/\n|\r\n|\r/)
  end

  def set_provisional_expiration_date
    @provisional_expiration_date = User.find(current_user.id).provisional_expiration_date
  end


end
