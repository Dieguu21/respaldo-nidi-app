# frozen_string_literal: true

class Turn < ApplicationRecord
  # Esto es asociacion entre USER-REQUEST-TURN
  has_many :requests
  has_many :users, through: :requests

  # Esto es asociacion entre USER-RATING-TURN
  has_many :ratings
  has_many :users, through: :ratings

  # Esto es asociacion entre USER-CHAT-TURN
  has_many :chats
  has_many :users, through: :chats

  # Esto es asociacion entre USER-TURN
  belongs_to :user
end
