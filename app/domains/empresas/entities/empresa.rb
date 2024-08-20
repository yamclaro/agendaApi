# app/domains/Empresas/entities/empresa.rb

module Empresas
  module Entities
    class Empresa
      attr_accessor :razao, :cnpj, :data_fundacao, :qtd_funcionarios, :qtd_max_funcionarios, :site, :sobre

      def initialize(razao:, cnpj:, data_fundacao:, qtd_funcionarios:, qtd_max_funcionarios:, site:, sobre:)
        @razao = razao
        @cnpj = cnpj
        @data_fundacao = data_fundacao
        @qtd_funcionarios = qtd_funcionarios
        @qtd_max_funcionarios = qtd_max_funcionarios
        @site = site
        @sobre = sobre
      end
    end
  end
end
