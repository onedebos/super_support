# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates_presence_of :title

  enum status: %i[opened in_progress completed]

  after_initialize do
    self.status ||= :opened if new_record?
  end
end
