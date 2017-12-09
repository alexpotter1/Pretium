class Currency < ApplicationRecord

  validates :currency_type, presence: true
  has_many :prices

  private
    def currency_params
      params.require(:currencies).require(:currency_type)
    end
end
