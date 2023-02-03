class Like < ApplicationRecord
  belongs_to :user
  belongs_to :deu
  validates_uniqueness_of :deu_id, scope: :user_id
end
