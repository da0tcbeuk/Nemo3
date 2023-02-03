class Deu < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :deu_tag_relations, dependent: :destroy
    has_many :tags, through: :deu_tag_relations, dependent: :destroy
    
end
