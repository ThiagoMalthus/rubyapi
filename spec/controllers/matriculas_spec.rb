require 'rails_helper'

describe FaturasController , type: :controller do
    it 'Lista instituicoes com sucesso' do
    get :index
    expect(response.status).to eql(200)
    end    
end

