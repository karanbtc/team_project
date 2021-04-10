class Team < ApplicationRecord
  has_many :shifts, dependent: :destroy
  has_many :users, through: :shifts, dependent: :destroy
end
