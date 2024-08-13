class Agenda < ApplicationRecord
  belongs_to :empresa
  belongs_to :cliente
  belongs_to :prestador
  belongs_to :servico
  validates :data, :hora, presence: true
end
