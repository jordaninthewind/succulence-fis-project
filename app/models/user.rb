class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, 
  # :recoverable, :rememberable, :trackable, :validatable, :registerable
  devise :database_authenticatable
  has_many :gardens
  has_many :plants, through: :gardens

end
