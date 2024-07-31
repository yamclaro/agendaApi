class CreateAgendas < ActiveRecord::Migration[7.2]
  def change
    create_table :agendas do |t|
      t.date :data
      t.time :hora
      t.string :observacao
      t.references :empresa, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true
      t.references :prestador, null: false, foreign_key: true
      t.references :servico, null: false, foreign_key: true

      t.timestamps
    end
  end
end
