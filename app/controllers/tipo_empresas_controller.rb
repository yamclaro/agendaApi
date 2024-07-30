class TipoEmpresasController < ApplicationController
  before_action :set_tipo_empresa, only: %i[ show update destroy ]

  # GET /tipo_empresas
  def index
    @tipo_empresas = TipoEmpresa.all

    render json: @tipo_empresas
  end

  # GET /tipo_empresas/1
  def show
    render json: @tipo_empresa
  end

  # POST /tipo_empresas
  def create
    @tipo_empresa = TipoEmpresa.new(tipo_empresa_params)

    if @tipo_empresa.save
      render json: @tipo_empresa, status: :created, location: @tipo_empresa
    else
      render json: @tipo_empresa.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipo_empresas/1
  def update
    if @tipo_empresa.update(tipo_empresa_params)
      render json: @tipo_empresa
    else
      render json: @tipo_empresa.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipo_empresas/1
  def destroy
    @tipo_empresa.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_empresa
      @tipo_empresa = TipoEmpresa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_empresa_params
      params.require(:tipo_empresa).permit(:descricao)
    end
end
