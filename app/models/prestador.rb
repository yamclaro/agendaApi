class Prestador < ApplicationRecord
  belongs_to :funcao
  validates :nome, :cpf, :email, :ativo, presence: true
end
