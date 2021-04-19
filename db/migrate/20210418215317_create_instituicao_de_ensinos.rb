class CreateInstituicaoDeEnsinos < ActiveRecord::Migration[5.0]
  def change
    create_table :instituicao_de_ensinos do |t|
      t.string :nome
      t.string :cnpj
      t.string :tipo

      t.timestamps
    end
  end
end
