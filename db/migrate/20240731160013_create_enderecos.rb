class CreateEnderecos < ActiveRecord::Migration[7.2]
  def change
    create_table :enderecos do |t|
      t.string :logradouro
      t.string :numero
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :cep
      t.string :complemento

      t.timestamps
    end
  end
end
