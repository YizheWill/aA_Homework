class User < ApplicationRecord
  attr_reader :password
  before_validation :ensure_session_token
  validates_presence_of :username, :session_token
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if !user
    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
