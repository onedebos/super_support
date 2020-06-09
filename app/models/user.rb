# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :comments

  enum role: %i[customer agent admin]

  after_initialize do
    self.role ||= :customer if new_record?
  end

  validates :email, presence: true, uniqueness: true
  validates_presence_of :password_digest, :name
  # add password validations
end
