class Descanso < ApplicationRecord
  belongs_to :prestador
  validates :data, :horaInicio, :horaFim, presence: true
end
