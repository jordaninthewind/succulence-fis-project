class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, 
  # :recoverable, :rememberable, :trackable, :validatable, 
  devise :database_authenticatable, :registerable
  validates :email, presence: true
  validates :password, presence: true
  
  has_many :gardens
  has_many :plants, through: :gardens

end
