class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: { maximum: 12 }
  validates :password, length: { minimum: 8, maximum: 16 }, presence: true, on: :create



end
