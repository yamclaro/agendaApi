class CreatePrestadorServicos < ActiveRecord::Migration[7.2]
  def change
    create_table :prestador_servicos do |t|
      t.references :prestador, null: false, foreign_key: true
      t.references :servico, null: false, foreign_key: true

      t.timestamps
    end
  end
end
