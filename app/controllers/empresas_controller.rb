# app/controllers/empresas_controller.rb
class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:show, :update, :destroy]

  def index
    @empresas = Empresas::Repositories::EmpresaRepository.new.all
    render json: @empresas
  end

  def show
    repository = Empresas::Repositories::EmpresaRepository.new
    empresa = repository.find(params[:id])

    if empresa
      render json: empresa, status: :ok
    else
      render json: { error: 'Empresa não encontrada' }, status: :not_found
    end
  end

  def create
    service = Empresas::Services::EmpresaServices.new(Empresas::Repositories::EmpresaRepository.new)
    empresa = service.create_empresa(empresa_params)
    if empresa.save?
      render json: empresa, status: :created
    else
      render json: { error: empresa.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique => e
    render json: { error: 'CNPJ já está em uso' }, status: :conflict
  end


  def update
    service = Empresas::Services::EmpresaServices.new(Empresas::Repositories::EmpresaRepository.new)
    service.update_empresa(@empresa.id, empresa_params)
    render json: @empresa
  end

  def destroy
    service = Empresas::Services::EmpresaServices.new(Empresas::Repositories::EmpresaRepository.new)
    service.delete_empresa(@empresa.id)
    head :no_content
  end

  private

  def set_empresa
    service = Empresas::Services::EmpresaServices.new(Empresas::Repositories::EmpresaRepository.new)
    @empresa = service.get_empresa(params[:id])
  end

  def empresa_params
    params.require(:empresa).permit(:razao, :cnpj, :data_fundacao, :qtd_funcionarios, :qtd_max_funcionarios, :site, :sobre)
  end
end
