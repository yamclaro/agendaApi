class SegmentosController < ApplicationController
  before_action :set_segmento, only: %i[ show update destroy ]

  # GET /segmentos
  def index
    @segmentos = Segmento.all

    render json: @segmentos
  end

  # GET /segmentos/1
  def show
    render json: @segmento
  end

  # POST /segmentos
  def create
    @segmento = Segmento.new(segmento_params)

    if @segmento.save
      render json: @segmento, status: :created, location: @segmento
    else
      render json: @segmento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /segmentos/1
  def update
    if @segmento.update(segmento_params)
      render json: @segmento
    else
      render json: @segmento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /segmentos/1
  def destroy
    @segmento.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_segmento
      @segmento = Segmento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def segmento_params
      params.require(:segmento).permit(:descricao, :observacao)
    end
end
