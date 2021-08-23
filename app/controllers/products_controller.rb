class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :set_market,  only: [:index, :create, :new]

  # GET /products
  def index
    @products = @market.products

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

 # GET /products/new
  def new
    @product = @market.products.new
    render json: @product
  end 

  # POST /products
  def create
    @product = @market.products.create(product_params)
    render json: @product, status: :created, location: @product
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_market
      @market = Market.find(params[:market_id])
     end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :market_id)
    end
end
