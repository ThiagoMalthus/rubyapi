class InstituicaoDeEnsino < ApplicationRecord
    

    #accepts_nested_attributes_for :matriculas

    validates :nome, presence: { message: "Não pode ser vazio"}
    validates :cnpj, length: { is: 14 ,
        message: "Seu CNPJ deve conter 14 digitos" }
    validates :cnpj, numericality: {only_integer: true, message: "Use apenas números"}
    validates :tipo, inclusion: { in: ['Universidade', 'Escola', 'Creche'],
        message: "Insira 'Universidade', 'Escola' ou 'Creche'" }
    validates :nome, :cnpj, uniqueness: {message: "Esse valor já existe na nossa base"}



    def as_json(options={})
        super(
          except: [:created_at, :updated_at]
        )
    end
end
