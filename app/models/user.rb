class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true , uniqueness: true 
  has_and_belongs_to_many :groups
  # has_and_belongs_to_many :emails, join_table: "emails_receivers", foreign_key: "receiver_id", class_name: 'Email'
  has_many :emails_receivers
  has_many :emails, through: :emails_receivers
end
