class Player < ApplicationRecord
  has_many :player_tournaments
  has_many :tournaments, through: :player_tournaments
end