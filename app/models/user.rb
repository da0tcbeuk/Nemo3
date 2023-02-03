class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :deus, dependent: :destroy
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 }
  has_many :likes, dependent: :destroy
  has_many :liked_deus, through: :likes, source: :deu
  
  mount_uploader :image, ImageUploader
  def already_liked?(deu)
    self.likes.exists?(deu_id: deu.id)
  end
end
