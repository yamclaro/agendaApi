class PrestadorsController < ApplicationController
  before_action :set_prestador, only: %i[ show update destroy ]

  # GET /prestadors
  def index
    @prestadors = Prestador.all

    render json: @prestadors
  end

  # GET /prestadors/1
  def show
    render json: @prestador
  end

  # POST /prestadors
  def create
    @prestador = Prestador.new(prestador_params)

    if @prestador.save
      render json: @prestador, status: :created, location: @prestador
    else
      render json: @prestador.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prestadors/1
  def update
    if @prestador.update(prestador_params)
      render json: @prestador
    else
      render json: @prestador.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prestadors/1
  def destroy
    @prestador.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestador
      @prestador = Prestador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prestador_params
      params.require(:prestador).permit(:nome, :cpf, :email, :funcao_id)
    end
end
