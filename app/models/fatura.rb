class Fatura < ApplicationRecord
  belongs_to :matricula

  validates :valor_da_fatura, :vencimento, :matricula, :status, presence: { message: "Não pode ser vazio"}
  validates :status, inclusion: { in: ['Aberta', 'Atrasada', 'Paga'],
    message: "Insira 'Aberta', 'Atrasada' ou 'Paga'" }
  

    def as_json(options={})
      super(
        except: [:created_at, :updated_at],
      )
    end
end
