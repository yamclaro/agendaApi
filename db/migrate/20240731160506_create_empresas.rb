class CreateEmpresas < ActiveRecord::Migration[7.2]
  def change
    create_table :empresas do |t|
      t.string :razao
      t.string :cnpj
      t.date :dataFundacao
      t.integer :qtdFuncionarios
      t.integer :qtdMaxFuncionarios
      t.string :site
      t.text :sobre

      t.timestamps
    end
  end
end
