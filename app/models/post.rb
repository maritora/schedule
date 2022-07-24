class Post < ApplicationRecord
  validates :title, presence: true
  validates :stday, presence: true
  validates :endday, presence: true
  validates :shujitsu, presence: true
  validates :memo, presence: true
end
