class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  # :recoverable, :rememberable, :trackable, :validatable, 
  devise :database_authenticatable, :registerable, :omniauthable, :omniauth_providers => [:github]
  validates :email, presence: true
  validates_uniqueness_of :email
  validates :password, presence: true

  has_many :gardens
  has_many :garden_plants, through: :gardens  

   def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end
end
