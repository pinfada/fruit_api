class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :set_market,  only: [:index, :create, :new]

  # GET /products
  def index
    render json: @products
  end

  # GET /products/1
  def show
    #render json: @product.to_json(include: [:prices, :characteristics])
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
      @product = Product.friendly.find(params[:id])
    end

    def set_market     
      if params[:market_id].present?
        #data = params[:market_id]
        #market_name = data.gsub('-', ' ')
        #@market = Market.friendly.find(params[:market_id])
        @market = Market.where(:id => params[:market_id])
        #puts "market name : ", market_name
        @products = @market.products
      else
        @products = Product.all
      end
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name)
    end
end
