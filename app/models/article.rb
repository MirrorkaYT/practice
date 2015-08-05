class Article < ActiveRecord::Base
	belongs_to :user
  validates :priority, presence: true, length: { maximum:3 }
  validates :priority, presence: true, numericality: { greater_than_or_equal_to: 1, message: "%{count} is less than 0" }
  validates :title, presence: true, length: {within: 5..25}
  validates :text, presence: true, length: { maximum: 1000 }

end
