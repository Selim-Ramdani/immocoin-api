class HousingsController < ApplicationController
  before_action :set_housing, only: %i[ show update destroy ]

  # GET /housings
  def index
    @housings = Housing.all

    render json: @housings
  end

  # GET /housings/1
  def show
    render json: @housing
  end

  # POST /housings
  def create
    @housing = Housing.new(housing_params)

    if @housing.save
      render json: @housing, status: :created, location: @housing
    else
      render json: @housing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /housings/1
  def update
    if @housing.update(housing_params)
      render json: @housing
    else
      render json: @housing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /housings/1
  def destroy
    @housing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_housing
      @housing = Housing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def housing_params
      params.require(:housing).permit(:title, :price, :description, :address)
    end
end
