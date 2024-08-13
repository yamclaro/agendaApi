class Cliente < ApplicationRecord
  belongs_to :empresa
  validates :nome, :telefone, :email, presence: true
end
