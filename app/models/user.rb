class User < ApplicationRecord
  belongs_to :restaurant, optional: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  enum role: [:customer, :seller]
end