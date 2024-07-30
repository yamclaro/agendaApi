class CreatePrestadors < ActiveRecord::Migration[7.2]
  def change
    create_table :prestadors do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.string :email
      t.date :data_engresso
      t.date :data_saida
      t.integer :status
      t.text :observacoes

      t.timestamps
    end
  end
end
