require 'rails_helper'

describe InstituicaoDeEnsinosController , type: :controller do
    it 'Lista instituicoes com sucesso' do
    get :index
    expect(response.status).to eql(200)
    end
    
    it 'Instituicao salva com tipo Universidade' do
        ie_teste = InstituicaoDeEnsino.new(
        nome: rand(1..10000).to_s,
        cnpj: rand(10000000000000..99999999999999).to_s,
        tipo: "Universidade"
    )
    expect(ie_teste).to be_valid
    end

    it 'Instituicao salva com tipo Escola' do
        ie_teste = InstituicaoDeEnsino.new(
        nome: rand(1..10000).to_s,
        cnpj: rand(10000000000000..99999999999999).to_s,
        tipo: "Escola"
    )
        expect(ie_teste).to be_valid
    end

    it 'Instituicao salva com tipo Creche' do
        ie_teste = InstituicaoDeEnsino.new(
        nome: rand(1..10000).to_s,
        cnpj: rand(10000000000000..99999999999999).to_s,
        tipo: "Creche"
    )
    expect(ie_teste).to be_valid
    end

    it 'Não salvo por Nome vazio' do
        ie_teste = InstituicaoDeEnsino.new(
        nome: nil,
        cnpj: rand(10000000000000..99999999999999).to_s,
        tipo: "Creche"
    )
    expect(ie_teste).to_not be_valid
    end

    
end

