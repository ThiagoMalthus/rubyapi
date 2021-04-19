class CreateFaturas < ActiveRecord::Migration[5.0]
  def change
    create_table :faturas do |t|
      t.float :valor_da_fatura
      t.date :vencimento
      t.references :matricula, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
