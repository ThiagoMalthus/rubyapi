class TrocarLimiteDoInteiro < ActiveRecord::Migration[5.0]
  def change
    change_column :Alunos, :celular, :integer, limit: 8
  end
end
