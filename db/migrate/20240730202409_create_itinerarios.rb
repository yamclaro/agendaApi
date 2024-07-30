class CreateItinerarios < ActiveRecord::Migration[7.2]
  def change
    create_table :itinerarios do |t|
      t.date :data
      t.time :hora_inicio
      t.timestamps
    end
  end
end
