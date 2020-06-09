class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates_presence_of :title

  enum status: [:opened, :in_progress, :completed]

  after_initialize do
      if self.new_record?
        self.status ||= :opened
      end
    end
end
