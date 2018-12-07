class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  before_save {self.email = email.downcase}

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false},
            length: 5..20


  VALID_EMAIL_REGEX = /(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)/i
  validates :email,
            presence: true,
            length: 8..50,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password



end