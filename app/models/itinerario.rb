class Itinerario < ApplicationRecord
  belongs_to :prestador
  validates :data, :horaInicio, :horaFim, presence: true
end
