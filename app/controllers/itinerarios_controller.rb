class ItinerariosController < ApplicationController
  before_action :set_itinerario, only: %i[ show update destroy ]

  # GET /itinerarios
  def index
    @itinerarios = Itinerario.all

    render json: @itinerarios
  end

  # GET /itinerarios/1
  def show
    render json: @itinerario
  end

  # POST /itinerarios
  def create
    @itinerario = Itinerario.new(itinerario_params)

    if @itinerario.save
      render json: @itinerario, status: :created, location: @itinerario
    else
      render json: @itinerario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /itinerarios/1
  def update
    if @itinerario.update(itinerario_params)
      render json: @itinerario
    else
      render json: @itinerario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /itinerarios/1
  def destroy
    @itinerario.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerario
      @itinerario = Itinerario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def itinerario_params
      params.require(:itinerario).permit(:data, :hora_inicio, :Prestador_id)
    end
end
