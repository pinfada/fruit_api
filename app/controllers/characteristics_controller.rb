class CharacteristicsController < ApplicationController
  before_action :set_characteristic, only: [:show, :update, :destroy]
  before_action :set_product, only: [:index, :create, :new]

  # GET /characteristics
  def index
    @characteristics = @product.characteristics

    render json: @characteristics
  end

  # GET /characteristics/1
  def show
    render json: @characteristic
  end

  # GET /products/new
  def new
    @characteristic = @product.characteristics.new

    if @characteristic.save
      render json: @characteristic, status: :created, location: @characteristic
    else
      render json: @characteristic.errors, status: :unprocessable_entity
    end
  end

  # POST /characteristics
  def create
    @characteristic = @product.characteristics.create(characteristic_params)
    render json: @characteristic, status: :created, location: @characteristic
  end

  # PATCH/PUT /characteristics/1
  def update
    if @characteristic.update(characteristic_params)
      render json: @characteristic
    else
      render json: @characteristic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /characteristics/1
  def destroy
    @characteristic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_characteristic
      @characteristic = Characteristic.find(params[:id])
    end

    def set_product
      @product = Product.friendly.find(params[:product_id])
    end

    # Only allow a list of trusted parameters through.
    def characteristic_params
      params.require(:characteristic).permit(:unit, :origine, :certification, :product_id)
    end
end
