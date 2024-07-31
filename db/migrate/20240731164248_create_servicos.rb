class CreateServicos < ActiveRecord::Migration[7.2]
  def change
    create_table :servicos do |t|
      t.string :descricao
      t.float :valor
      t.time :tempo

      t.timestamps
    end
  end
end
