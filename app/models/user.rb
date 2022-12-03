class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,         # Include default devise modules. Others available are :confirmable, 
         :recoverable, :rememberable, :validatable         # :lockable, :timeoutable, :trackable and :omniauthable
    has_one :cart, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :comments
end
