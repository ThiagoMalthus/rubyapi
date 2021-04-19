require 'test_helper'

class InstituicaoDeEnsinosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instituicao_de_ensino = instituicao_de_ensinos(:one)
  end

  test "should get index" do
    get instituicao_de_ensinos_url, as: :json
    assert_response :success
  end

  test "should create instituicao_de_ensino" do
    assert_difference('InstituicaoDeEnsino.count') do
      post instituicao_de_ensinos_url, params: { instituicao_de_ensino: { cnpj: @instituicao_de_ensino.cnpj, nome: @instituicao_de_ensino.nome, tipo: @instituicao_de_ensino.tipo } }, as: :json
    end

    assert_response 201
  end

  test "should show instituicao_de_ensino" do
    get instituicao_de_ensino_url(@instituicao_de_ensino), as: :json
    assert_response :success
  end

  test "should update instituicao_de_ensino" do
    patch instituicao_de_ensino_url(@instituicao_de_ensino), params: { instituicao_de_ensino: { cnpj: @instituicao_de_ensino.cnpj, nome: @instituicao_de_ensino.nome, tipo: @instituicao_de_ensino.tipo } }, as: :json
    assert_response 200
  end

  test "should destroy instituicao_de_ensino" do
    assert_difference('InstituicaoDeEnsino.count', -1) do
      delete instituicao_de_ensino_url(@instituicao_de_ensino), as: :json
    end

    assert_response 204
  end
end
