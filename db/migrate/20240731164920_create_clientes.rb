class CreateClientes < ActiveRecord::Migration[7.2]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :telefone
      t.string :email
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
