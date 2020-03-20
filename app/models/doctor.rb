class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  validates :name, :uniqueness: true
end
