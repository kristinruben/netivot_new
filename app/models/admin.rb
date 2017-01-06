class Admin < ApplicationRecord

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email, with: /@/

  validates :password, length: { minimum: 8 }, unless: 'password.nil?'
  validates_confirmation_of :password

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
