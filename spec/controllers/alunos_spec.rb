require 'rails_helper'

describe AlunosController , type: :controller do
    it 'Lista alunos com sucesso' do
    get :index
    expect(response.status).to eql(200)
    end
    
    it 'Aluno salvo com sucesso com pagamento Boleto e genero M' do
    aluno_teste = Aluno.new(
        nome: rand(1..10000).to_s,
        cpf: rand(10000000000..99999999999).to_s,
        nascimento: "1990-05-12",
        celular: 21983126591,
        genero: "M",
        meio_de_pagamento: "Boleto"
    )
    expect(aluno_teste).to be_valid
    end

    it 'Aluno salvo com sucesso com pagamento Cartão e genero F' do
        aluno_teste = Aluno.new(
            nome: rand(1..10000).to_s,
            cpf: rand(10000000000..99999999999).to_s,
            nascimento: "1990-05-12",
            celular: 21983126591,
            genero: "F",
            meio_de_pagamento: "Cartao"
        )
    expect(aluno_teste).to be_valid
    end

    it 'Aluno não salvo por nome vazio' do
        aluno_teste = Aluno.new(
            nome: nil,
            cpf: rand(10000000000..99999999999).to_s,
            nascimento: "1990-05-12",
            celular: 21983126591,
            genero: "F",
            meio_de_pagamento: "Cartao"
        )
        expect(aluno_teste).to_not be_valid
    end

    it 'Aluno não salvo por CPF vazio' do
        aluno_teste = Aluno.new(
            nome: rand(1..10000).to_s,
            cpf: nil,
            nascimento: "1990-05-12",
            celular: 21983126591,
            genero: "F",
            meio_de_pagamento: "Cartao"
        )
        expect(aluno_teste).to_not be_valid
    end

    it 'Aluno não salvo por Genero vazio' do
        aluno_teste = Aluno.new(
            nome: rand(1..10000).to_s,
            cpf: rand(10000000000..99999999999).to_s,
            nascimento: "1990-05-12",
            celular: 21983126591,
            genero: nil,
            meio_de_pagamento: "Cartao"
        )
        expect(aluno_teste).to_not be_valid
    end

    it 'Aluno não salvo por Genero invalido' do
        aluno_teste = Aluno.new(
            nome: rand(1..10000).to_s,
            cpf: rand(10000000000..99999999999).to_s,
            nascimento: "1990-05-12",
            celular: 21983126591,
            genero: "C",
            meio_de_pagamento: "Cartao"
        )
        expect(aluno_teste).to_not be_valid
    end

    it 'Aluno não salvo por Meio de Pagamento vazio' do
        aluno_teste = Aluno.new(
            nome: rand(1..10000).to_s,
            cpf: rand(10000000000..99999999999).to_s,
            nascimento: "1990-05-12",
            celular: 21983126591,
            genero: "M",
            meio_de_pagamento: nil
        )
        expect(aluno_teste).to_not be_valid
    end

    it 'Aluno não salvo por Meio de Pagamento invalido' do
        aluno_teste = Aluno.new(
            nome: rand(1..10000).to_s,
            cpf: rand(10000000000..99999999999).to_s,
            nascimento: "1990-05-12",
            celular: 21983126591,
            genero: "M",
            meio_de_pagamento: "Pedro"
        )
        expect(aluno_teste).to_not be_valid
    end
end

