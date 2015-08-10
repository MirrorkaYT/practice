class User < ActiveRecord::Base
	has_many :articles, dependent: :destroy
	has_secure_password

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :nickname, presence: true,
            length: {within: 6..20}
  validates :email, presence: true,
            format: {with: EMAIL_REGEX}
  validates :password,
            length: {within: 6..40}, on: :create
  validates_uniqueness_of :email, :nickname

  after_create :send_invite_email

  private

  def send_invite_email
    UserMailer.welcome_mail(self).deliver_now
  end
end
