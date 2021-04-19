class Aluno < ApplicationRecord
    

    #accepts_nested_attributes_for :matriculas

    validates :nome, :cpf, :genero, :meio_de_pagamento, presence: { message: "Não pode ser vazio"}
    validates :genero, inclusion: { in: ['M', 'F'],
        message: "Insira 'M' ou 'F'" }
    validates :meio_de_pagamento, inclusion: { in: ['Boleto', 'Cartao'],
        message: "Insira 'Boleto' ou 'Cartao'" }
    validates :cpf, length: { is: 11 ,
        message: "Seu CPF deve conter 11 digitos" }
    validates :cpf, numericality: {only_integer: true, message: "Use apenas números"}
    validates :nome, :cpf, uniqueness: {message: "Esse valor já existe na nossa base"}


    def as_json(options={})
        super(
          except: [:created_at, :updated_at]
        )
    end
end
