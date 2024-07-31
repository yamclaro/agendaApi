class FuncaosController < ApplicationController
  before_action :set_funcao, only: %i[ show update destroy ]

  # GET /funcaos
  def index
    @funcaos = Funcao.all

    render json: @funcaos
  end

  # GET /funcaos/1
  def show
    render json: @funcao
  end

  # POST /funcaos
  def create
    @funcao = Funcao.new(funcao_params)

    if @funcao.save
      render json: @funcao, status: :created, location: @funcao
    else
      render json: @funcao.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /funcaos/1
  def update
    if @funcao.update(funcao_params)
      render json: @funcao
    else
      render json: @funcao.errors, status: :unprocessable_entity
    end
  end

  # DELETE /funcaos/1
  def destroy
    @funcao.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcao
      @funcao = Funcao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def funcao_params
      params.require(:funcao).permit(:descricao, :observacao)
    end
end
