class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  # :recoverable, :rememberable, :trackable, :validatable, 
  devise :database_authenticatable, :registerable, :omniauthable
  validates :email, presence: true
  validates_uniqueness_of :email
  validates :password, presence: true

  has_many :gardens
  has_many :garden_plants, through: :gardens  
end
