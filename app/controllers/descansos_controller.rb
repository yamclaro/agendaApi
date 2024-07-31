class DescansosController < ApplicationController
  before_action :set_descanso, only: %i[ show update destroy ]

  # GET /descansos
  def index
    @descansos = Descanso.all

    render json: @descansos
  end

  # GET /descansos/1
  def show
    render json: @descanso
  end

  # POST /descansos
  def create
    @descanso = Descanso.new(descanso_params)

    if @descanso.save
      render json: @descanso, status: :created, location: @descanso
    else
      render json: @descanso.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /descansos/1
  def update
    if @descanso.update(descanso_params)
      render json: @descanso
    else
      render json: @descanso.errors, status: :unprocessable_entity
    end
  end

  # DELETE /descansos/1
  def destroy
    @descanso.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_descanso
      @descanso = Descanso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def descanso_params
      params.require(:descanso).permit(:data, :horaInicio, :horaFim, :prestador_id)
    end
end
