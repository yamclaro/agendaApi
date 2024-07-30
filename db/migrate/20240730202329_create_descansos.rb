class CreateDescansos < ActiveRecord::Migration[7.2]
  def change
    create_table :descansos do |t|
      t.date :data
      t.time :hora_inicio
      t.timestamps
    end
  end
end
