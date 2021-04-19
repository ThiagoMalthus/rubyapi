class Matricula < ApplicationRecord
  belongs_to :instituicao_de_ensino
  belongs_to :aluno

  has_many :faturas

  accepts_nested_attributes_for :faturas

  validates :valor_total, :quantidade_de_faturas, :vencimento, :curso, :instituicao_de_ensino, :aluno, presence: { message: "Não pode ser vazio"}
  validates :quantidade_de_faturas, numericality: { greater_than: 0 ,
    message: "Deve haver ao menos 1 fatura" }
  validates :vencimento, numericality: { greater_than: 0 ,
    message: "O valor deve ser entre 1 e 31" }
  validates :vencimento, numericality: { less_than: 32 ,
    message: "O valor deve ser entre 1 e 31" }

  def aluno_nome
    self.aluno.nome
  end

  def instituicao_de_ensino_nome
    self.instituicao_de_ensino.nome
  end
  
  def as_json(options={})
    super(
      except: [:created_at, :updated_at],
      methods: [ :aluno_nome, :instituicao_de_ensino_nome],
      include: [faturas: {except: [:created_at, :updated_at]}]
      #include: [:aluno, :instituicao_de_ensino]
    )
  end
end
