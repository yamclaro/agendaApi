class Prestador < ApplicationRecord
    self.primary_keys = :empresa_id, :cpf

   belongs_to :empresa
   belongs_to :itinerario
   belongs_to :descanso
end
