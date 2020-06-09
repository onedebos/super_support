# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :user
  has_many :users
end
