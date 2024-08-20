module Empresas
  module Repositories
    class EmpresaRepository
      def initialize
        @model = ::Empresa # Usando o modelo ActiveRecord
      end

      def save(empresa)
        @model.create(
          razao: empresa.razao,
          cnpj: empresa.cnpj,
          data_fundacao: empresa.data_fundacao,
          qtd_funcionarios: empresa.qtd_funcionarios,
          qtd_max_funcionarios: empresa.qtd_max_funcionarios,
          site: empresa.site,
          sobre: empresa.sobre
        )
      end

      def find(id)
        @model.find_by(id: id)
      end

      def all
        @model.all
      end

      def update(id, attributes)
        empresa = @model.find(id)
        empresa.update(attributes)
      end

      def delete(id)
        @model.find(id).destroy
      end
    end
  end
end
