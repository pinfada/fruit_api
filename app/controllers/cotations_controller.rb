class CotationsController < ApplicationController
  before_action :set_cotation, only: [:show, :update, :destroy]

  # GET /cotations
  def index
    @cotations = Cotation.all

    render json: @cotations
  end

  # GET /cotations/1
  def show
    render json: @cotation
  end

  # POST /cotations
  def create
    @cotation = Cotation.new(cotation_params)

    if @cotation.save
      render json: @cotation, status: :created, location: @cotation
    else
      render json: @cotation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cotations/1
  def update
    if @cotation.update(cotation_params)
      render json: @cotation
    else
      render json: @cotation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cotations/1
  def destroy
    @cotation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cotation
      @cotation = Cotation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cotation_params
      params.require(:cotation).permit(:cotation_date, :price_id, :product_id)
    end
end
