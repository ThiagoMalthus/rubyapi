class CreateMatriculas < ActiveRecord::Migration[5.0]
  def change
    create_table :matriculas do |t|
      t.float :valor_total
      t.integer :quantidade_de_faturas
      t.integer :vencimento
      t.string :curso
      t.references :instituicao_de_ensino, foreign_key: true
      t.references :aluno, foreign_key: true

      t.timestamps
    end
  end
end
