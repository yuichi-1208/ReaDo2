class Book < ApplicationRecord
  has_many :summaries, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :image_url, presence: true
  validates :url, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :isbn, presence: true
end
