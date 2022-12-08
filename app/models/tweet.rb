class Tweet < ApplicationRecord
  validates :text, {presence: true, length:{maximum:140}}


  belongs_to :user
  has_many :comments
  has_many :likes, as: :likeable
end
