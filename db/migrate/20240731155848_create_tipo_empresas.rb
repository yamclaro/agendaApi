class CreateTipoEmpresas < ActiveRecord::Migration[7.2]
  def change
    create_table :tipo_empresas do |t|
      t.string :descricao
      t.string :observacao

      t.timestamps
    end
  end
end
