class CreateDescansos < ActiveRecord::Migration[7.2]
  def change
    create_table :descansos do |t|
      t.date :data
      t.time :horaInicio
      t.time :horaFim
      t.references :prestador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
