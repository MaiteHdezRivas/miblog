class Autor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :articulos

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
