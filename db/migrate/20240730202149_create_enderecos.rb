class CreateEnderecos < ActiveRecord::Migration[7.2]
  def change
    create_table :enderecos do |t|
      t.string :logradouro
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :cep
      t.references :Empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
