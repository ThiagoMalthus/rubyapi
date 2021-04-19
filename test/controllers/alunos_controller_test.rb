require 'test_helper'

class AlunosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aluno = alunos(:one)
  end

  test "should get index" do
    get alunos_url, as: :json
    assert_response :success
  end

  test "should create aluno" do
    assert_difference('Aluno.count') do
      post alunos_url, params: { aluno: { celular: @aluno.celular, cpf: @aluno.cpf, genero: @aluno.genero, meio_de_pagamento: @aluno.meio_de_pagamento, nascimento: @aluno.nascimento, nome: @aluno.nome } }, as: :json
    end

    assert_response 201
  end

  test "should show aluno" do
    get aluno_url(@aluno), as: :json
    assert_response :success
  end

  test "should update aluno" do
    patch aluno_url(@aluno), params: { aluno: { celular: @aluno.celular, cpf: @aluno.cpf, genero: @aluno.genero, meio_de_pagamento: @aluno.meio_de_pagamento, nascimento: @aluno.nascimento, nome: @aluno.nome } }, as: :json
    assert_response 200
  end

  test "should destroy aluno" do
    assert_difference('Aluno.count', -1) do
      delete aluno_url(@aluno), as: :json
    end

    assert_response 204
  end
end
