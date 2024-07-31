class CreateFuncaos < ActiveRecord::Migration[7.2]
  def change
    create_table :funcaos do |t|
      t.string :descricao
      t.text :observacao

      t.timestamps
    end
  end
end
