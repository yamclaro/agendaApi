class Empresa < ApplicationRecord
    validates :razao, :cnpj, :dataFundacao, :qtdFuncionarios, :qtdMaxFuncionarios, :site, :sobre, presence: true
end
