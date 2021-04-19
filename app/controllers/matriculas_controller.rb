class MatriculasController < ApplicationController
  before_action :set_matricula, only: [:show, :update, :destroy]
  
  # GET /matriculas
  def index
    @matriculas = Matricula.all

    render json: @matriculas
  end

  # GET /matriculas/1
  def show
    render json: @matricula
  end

  # POST /matriculas
  def create
    @matricula = Matricula.new(matricula_params)
    
    if @matricula.save
      criar_faturas(@matricula)
      render json: @matricula, status: :created, location: @matricula
    else
      render json: @matricula.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /matriculas/1
  def update
    if @matricula.update(matricula_params)
      render json: @matricula
    else
      render json: @matricula.errors, status: :unprocessable_entity
    end
  end

  # DELETE /matriculas/1
  def destroy
    @matricula.destroy
  end

  def criar_faturas(matricula)
    parcela= matricula.valor_total/matricula.quantidade_de_faturas
    parcela = parcela.round(2)
    diferenca = parcela * matricula.quantidade_de_faturas
    diferenca = matricula.valor_total-diferenca
    data_criacao = Time.now
    data = data_criacao

    matricula.quantidade_de_faturas.times do |numero|
      #Ajuste pelo arredondamento
      if ( matricula.quantidade_de_faturas == numero )
        valor = parcela-diferenca
      else
        valor = parcela
      end

      #ajuste de data de vencimento para essa fatura em especifico
     
      if (data_criacao.day<matricula.vencimento && numero==1)
        data = Time.new(data_criacao.year, data_criacao.month+1, matricula.vencimento)
        data_criacao = data
      else
        data = Time.new(data_criacao.year, (data_criacao+(numero-1).months).month, matricula.vencimento)
      end
      
      #cria a fatura
      fatura = Fatura.create(
        valor_da_fatura: valor,
        vencimento: data,
        matricula_id: matricula.id,
        status: "Aberta",
      )

      fatura.save
    end
    "completo"
  end

  def dias_mes (mes)
    (Time.new(2002, mes+1, 1) - 1.days).day
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matricula
      @matricula = Matricula.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def matricula_params
      params.require(:matricula).permit(:valor_total, :quantidade_de_faturas, :vencimento, :curso, :instituicao_de_ensino_id, :aluno_id)
    end
end
