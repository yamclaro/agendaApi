class ChangeTempoInServicos < ActiveRecord::Migration[7.2]
  def change
    change_column :servicos, :tempo, :string
  end
end
