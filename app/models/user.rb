class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }, presence: true
  validates :password, :length => { :minimum => 5 }, presence: true
  validates :password_confirmation, presence: true

  before_save :email_downcase

  def email_downcase
    self.email.downcase!
  end

  def self.authenticate_with_credentials(email, password)
    if (email)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      return user
    end
end
end
end
