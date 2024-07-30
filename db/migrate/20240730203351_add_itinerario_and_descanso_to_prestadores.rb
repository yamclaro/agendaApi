class AddItinerarioAndDescansoToPrestadores < ActiveRecord::Migration[7.2]
  def change
    # Adicionar a coluna itinerario_id e criar a referência
    add_reference :prestadores, :itinerario, foreign_key: true

    # Adicionar a coluna descanso_id e criar a referência
    add_reference :prestadores, :descanso, foreign_key: true
  end
end
