class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant

  def index
    @items = Item.where(restaurant: @restaurant).order(:name)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to restaurant_items_path(@restaurant), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to restaurant_items_path(@restaurant), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_items_path(@restaurant), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_item
      @item = Item.find(params[:id])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def item_params
      price = params[:item][:price].to_s.gsub(/[^\d.]/, '')
      params[:item][:price] = price

      params.require(:item).permit(:name, :price, :restaurant_id, :sold_out)
    end
end
