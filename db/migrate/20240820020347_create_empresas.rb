class CreateEmpresas < ActiveRecord::Migration[7.2]
  def change
    create_table :empresas do |t|
      t.string :razao
      t.string :cnpj
      t.date :data_fundacao
      t.integer :qtd_funcionarios
      t.integer :qtd_max_funcionarios
      t.string :site
      t.text :sobre

      t.timestamps
    end
  end
end
