class PricesController < ApplicationController
  before_action :set_price, only: [:show, :update, :destroy]
  before_action :set_product, only: [:index, :create, :new]

  # GET /prices
  def index
    @prices = @product.prices

    render json: @prices
  end

  # GET /prices/1
  def show
    render json: @price
  end

  # GET /products/new
  def new
    @price = @product.prices.new
    if @price.save
      render json: @price, status: :created, location: @price
    else
      render json: @price.errors, status: :unprocessable_entity
    end
  end

  # POST /prices
  def create
    @price = @product.prices.create(product_params)
    render json: @price, status: :created, location: @price
  end

  # PATCH/PUT /prices/1
  def update
    if @price.update(price_params)
      render json: @price
    else
      render json: @price.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prices/1
  def destroy
    @price.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Only allow a list of trusted parameters through.
    def price_params
      params.require(:price).permit(:price, :product_id)
    end
end
