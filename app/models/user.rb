class User < ActiveRecord::Base
	has_many :articles
	has_secure_password
	validates_uniqueness_of :email, :nickname
end
