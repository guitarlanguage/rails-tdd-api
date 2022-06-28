class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true
  # validates_uniqueness_of :slug
  validates :slug, presence: true, uniqueness: true
end
