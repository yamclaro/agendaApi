class CreateSegmentos < ActiveRecord::Migration[7.2]
  def change
    create_table :segmentos do |t|
      t.string :descricao
      t.string :observacao

      t.timestamps
    end
  end
end
