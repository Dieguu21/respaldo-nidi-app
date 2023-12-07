# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Esto es asociacion entre USER-REQUEST-TURN
  has_many :requests
  has_many :turns, through: :requests

  # Esto es asociacion entre USER-RATING-TURN
  has_many :ratings
  has_many :turns, through: :ratings

  # Esto es asociacion entre USER-CHAT-TURN
  has_many :chats
  has_many :turns, through: :chats

  # Esto es asociacion entre USER-TURN
  has_many :turns
end
