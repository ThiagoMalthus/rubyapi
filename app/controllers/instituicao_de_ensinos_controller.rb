class InstituicaoDeEnsinosController < ApplicationController
  before_action :set_instituicao_de_ensino, only: [:show, :update, :destroy]

  # GET /instituicao_de_ensinos
  def index
    @instituicao_de_ensinos = InstituicaoDeEnsino.all

    render json: @instituicao_de_ensinos
  end

  # GET /instituicao_de_ensinos/1
  def show
    render json: @instituicao_de_ensino
  end

  # POST /instituicao_de_ensinos
  def create
    @instituicao_de_ensino = InstituicaoDeEnsino.new(instituicao_de_ensino_params)

    if @instituicao_de_ensino.save
      render json: @instituicao_de_ensino, status: :created, location: @instituicao_de_ensino
    else
      render json: @instituicao_de_ensino.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /instituicao_de_ensinos/1
  def update
    if @instituicao_de_ensino.update(instituicao_de_ensino_params)
      render json: @instituicao_de_ensino
    else
      render json: @instituicao_de_ensino.errors, status: :unprocessable_entity
    end
  end

  # DELETE /instituicao_de_ensinos/1
  def destroy
    @instituicao_de_ensino.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instituicao_de_ensino
      @instituicao_de_ensino = InstituicaoDeEnsino.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def instituicao_de_ensino_params
      params.require(:instituicao_de_ensino).permit(:nome, :cnpj, :tipo)
    end
end
