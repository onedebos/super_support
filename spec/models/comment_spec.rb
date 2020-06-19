# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'test for valid comments' do
    it 'accepts a comment if required fields are present' do
      user = User.create(name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password')
      ticket = Ticket.create(user_id: user.id, title: 'test ticket', request: 'this is a test request')
      comment = Comment.create(user_id: user.id, ticket_id: ticket.id, comment: 'test comment')
      expect(comment).to be_valid
    end
  end

  describe 'test for invalid comments' do
    it 'does not create a comment if a user is not present' do
      user = User.create(name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password')
      ticket = Ticket.create(user_id: user.id, title: 'test ticket', request: 'this is a test request')
      comment = Comment.create(user_id: 0, ticket_id: ticket.id, comment: 'test comment')
      expect(comment).to_not be_valid
    end

    it 'does not create a comment if a ticket is not present' do
      user = User.create(name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password')
      ticket = Ticket.create(user_id: user.id, title: 'test ticket', request: 'this is a test request')
      comment = Comment.create(user_id: user.id, ticket_id: 0, comment: 'test comment')
      expect(comment).to_not be_valid
    end
  end
end
