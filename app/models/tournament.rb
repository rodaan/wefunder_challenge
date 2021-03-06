class Tournament < ApplicationRecord
  has_many :user_tournaments
  has_many :users, through: :user_tournaments
  has_many :player_tournaments
  has_many :players, through: :player_tournaments
  has_many :matches
end