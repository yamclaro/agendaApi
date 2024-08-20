# app/domains/empresa/services/empresa_services.rb

module Empresas
  module Services
    class EmpresaServices
      def initialize(empresa_repository)
        @empresa_repository = empresa_repository
      end

      def create_empresa(params)
        empresa = Empresas::Entities::Empresa.new(
          razao: params[:razao],
          cnpj: params[:cnpj],
          data_fundacao: params[:data_fundacao],
          qtd_funcionarios: params[:qtd_funcionarios],
          qtd_max_funcionarios: params[:qtd_max_funcionarios],
          site: params[:site],
          sobre: params[:sobre]
        )
        @empresa_repository.save(empresa)
      end

      def update_empresa(id, params)
        @empresa_repository.update(id, params)
      end

      def delete_empresa(id)
        @empresa_repository.delete(id)
      end

      def get_empresa(id)
        @empresa_repository.find(id)
      end
    end
  end
end
