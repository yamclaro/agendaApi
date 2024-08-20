# app/domains/Empresas/entities/empresa.rb

module Empresas
  module Entities
    class Empresa
      include ActiveModel::Model

      attr_accessor :razao, :cnpj, :data_fundacao, :qtd_funcionarios, :qtd_max_funcionarios, :site, :sobre

      validates :razao, :cnpj, :data_fundacao, :qtd_funcionarios, :qtd_max_funcionarios, :site, :sobre, presence: true
      validates :cnpj, format: { with: /\A\d{14}\z/, message: "must be 14 digits" }

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
