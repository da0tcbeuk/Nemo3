class Tag < ApplicationRecord
  validates :name, presence: true
  
  has_many :deu_tag_relations, dependent: :destroy
  
  has_many :deus, through: :deu_tag_relations, dependent: :destroy
end
