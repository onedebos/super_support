class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments

  enum status: [:opened, :in_progress, :completed]

  after_initialize do
      if self.new_record?
        self.role ||= :opened
      end
    end
end
