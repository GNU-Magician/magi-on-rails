class Category < ApplicationRecord

  has_many :article_categories
  has_many :articles, through: :article_categories

  validates :name, presence: true, uniqueness: true, length: 5..25
end