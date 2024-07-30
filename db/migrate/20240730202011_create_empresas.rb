class CreateEmpresas < ActiveRecord::Migration[7.2]
  def change
    create_table :empresas do |t|
      t.string :razao
      t.string :cnpj
      t.string :telefone
      t.string :email
      t.string :site
      t.string :dataFundacao
      t.integer :status
      t.text :observacao
      t.references :Segmento, null: false, foreign_key: true
      t.references :TipoEmpresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
