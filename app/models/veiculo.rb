class Veiculo < ApplicationRecord
  belongs_to :user
  validates :marca, presence: true
end
