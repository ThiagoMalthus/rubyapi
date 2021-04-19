require 'test_helper'

class MatriculasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matricula = matriculas(:one)
  end

  test "should get index" do
    get matriculas_url, as: :json
    assert_response :success
  end

  test "should create matricula" do
    assert_difference('Matricula.count') do
      post matriculas_url, params: { matricula: { aluno_id: @matricula.aluno_id, curso: @matricula.curso, instituicao_de_ensino_id: @matricula.instituicao_de_ensino_id, quantidade_de_faturas: @matricula.quantidade_de_faturas, valor_total: @matricula.valor_total, vencimento: @matricula.vencimento } }, as: :json
    end

    assert_response 201
  end

  test "should show matricula" do
    get matricula_url(@matricula), as: :json
    assert_response :success
  end

  test "should update matricula" do
    patch matricula_url(@matricula), params: { matricula: { aluno_id: @matricula.aluno_id, curso: @matricula.curso, instituicao_de_ensino_id: @matricula.instituicao_de_ensino_id, quantidade_de_faturas: @matricula.quantidade_de_faturas, valor_total: @matricula.valor_total, vencimento: @matricula.vencimento } }, as: :json
    assert_response 200
  end

  test "should destroy matricula" do
    assert_difference('Matricula.count', -1) do
      delete matricula_url(@matricula), as: :json
    end

    assert_response 204
  end
end
