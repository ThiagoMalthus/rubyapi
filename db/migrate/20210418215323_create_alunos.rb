class CreateAlunos < ActiveRecord::Migration[5.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :cpf
      t.date :nascimento
      t.integer :celular
      t.string :genero
      t.string :meio_de_pagamento

      t.timestamps
    end
  end
end
