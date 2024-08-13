class Endereco < ApplicationRecord
    validates :logradouro, :numero, :bairro, :cidade, :uf, :cep, :complemento, presence: true
end
