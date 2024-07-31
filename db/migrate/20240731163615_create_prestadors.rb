class CreatePrestadors < ActiveRecord::Migration[7.2]
  def change
    create_table :prestadors do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.bit :ativo
      t.references :funcao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
