class FaturasController < ApplicationController
  before_action :set_fatura, only: [:show, :update, :destroy]

  # GET /faturas
  def index
    @faturas = Fatura.all

    render json: @faturas
  end

  # GET /faturas/1
  def show
    render json: @fatura
  end

  # POST /faturas
  def create
    @fatura = Fatura.new(fatura_params)

    if @fatura.save
      render json: @fatura, status: :created, location: @fatura
    else
      render json: @fatura.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /faturas/1
  def update
    if @fatura.update(fatura_params)
      render json: @fatura
    else
      render json: @fatura.errors, status: :unprocessable_entity
    end
  end

  # DELETE /faturas/1
  def destroy
    @fatura.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fatura
      @fatura = Fatura.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fatura_params
      params.require(:fatura).permit(:valor_da_fatura, :vencimento, :matricula_id, :status)
    end
end
