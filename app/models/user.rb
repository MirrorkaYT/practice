class User < ActiveRecord::Base
	has_many :articles
	has_secure_password

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :nickname, presence: true,
            length: {maximum: 20}
  validates :email, presence: true,
            format: {with: EMAIL_REGEX}
  validates :password,
            length: {within: 6..40}, on: :create
  validates_uniqueness_of :email, :nickname
end
