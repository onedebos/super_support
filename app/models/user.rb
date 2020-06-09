class User < ApplicationRecord
    has_secure_password
    has_many :comments

    enum role: [:customer, :agent, :admin]

    after_initialize do
        if self.new_record?
          self.role ||= :customer
        end
      end

    validates :email, presence: true, uniqueness: true
    validates_presence_of :password_digest, :name
    # add password validations
end
