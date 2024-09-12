class EmpresasController < ApplicationController
  before_action only: %i[ show update destroy ]

  # GET /empresas
  def index
    @empresas = Empresa.all
    render json: @empresas
  end

  # GET /empresas/1
  def show
    @empresa = Empresa.find_by(id: params[:id])
    if @empresa.present?
      render json: @empresa
    else
      render json: return_status_result(model: 'empresa', status: 404, message: 'A empresa solicitada não foi encontrada.'), status: :not_found
    end
  end

  # POST /empresas
  def create
    @empresa = Empresa.new(empresa_params)

    if @empresa.save
      render json: @empresa, status: :created, location: @empresa
    else
      render json: @empresa.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /empresas/1
  def update
    @empresa = Empresa.find_by(id: params[:id])
    if @empresa.present?
      if @empresa.update(empresa_params)
        render json: @empresa
      else
        render json: @empresa.errors, status: :unprocessable_entity
      end
    else
      render json: return_status_result(model: 'empresa', status: 404, message: 'A empresa solicitada não foi encontrada.'), status: :not_found
    end
  end

  # DELETE /empresas/1
  def destroy
    @empresa = Empresa.find_by(id: params[:id])
    if @empresa.present?
      @empresa.destroy
      render json: @empresa
    unless
      render json: @empresa.errors, status: :unprocessable_entity
    end
    else
      render json: return_status_result(model: 'empresa', status: 404, message: 'A empresa solicitada não foi encontrada.'), status: :not_found
    end
  end

  private
  
    def empresa_params
      params.require(:empresa).permit(:razao, :cnpj, :telefone, :email, :site, :dataFundacao, :status, :observacao, :Segmento_id, :TipoEmpresa_id)
    end
end
