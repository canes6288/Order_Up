class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @orders = Order.where(restaurant: @restaurant)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.items.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    if items_attributes.nil?
      flash.now[:alert] = 'Missing items'
      return render :new
    end

    # Add item to the order
    build_items_for_order(item_ids)

    # Set user_id to the sender's id
    @order.user_id = current_user.id

    if @order.save
      redirect_to new_order_path, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    redirect_to orders_path(restaurant_id: @order.restaurant), notice: 'Order completed.'
  end

  private
    def build_items_for_order(item_ids)
      item_ids.each do |item_id|
        @order.line_items.build(order: @order, item_id: item_id)
      end
    end

    def items_attributes
      params[:items_attributes]
    end

    def item_ids
      items_attributes.pluck(:id).map(&:to_i)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:number, 
                                    :location, 
                                    :restaurant_id, 
                                    :user_id, 
                                    :section, 
                                    :seat
                                  )
    end
end
