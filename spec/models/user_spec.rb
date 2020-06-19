# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '# when created user is valid' do
    let(:user) { User.create(name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password') }
    it 'checks for the presence of values in required fields' do
      expect(user.name).to eq('test_user')
      expect(user.email).to eq('test@test.com')
      expect(user.password).to eq('password')
    end

    it 'verifies that user is valid if all fields are present' do
      expect(user).to be_valid
    end

    it "check that a user's role is a customer when first created" do
      expect(user.role).to eq('customer')
    end

    it 'checks that a user can create multiple tickets' do
      ticket = Ticket.create!(title: 'test ticket', request: 'new request', user_id: user.id)
      ticket1 = Ticket.create!(title: 'test ticket', request: 'new request', user_id: user.id)
      ticket2 = Ticket.create!(title: 'test ticket', request: 'new request', user_id: user.id)
      ticket3 = Ticket.create!(title: 'test ticket', request: 'new request', user_id: user.id)
      expect(user.tickets.length).to eq(4)
    end
  end

  describe '# when created user is not valid' do
    it 'does not create a user if name is missing' do
      user2 = User.new(name: '', email: 'test@test.com', password: 'password', password_confirmation: 'password')
      expect(user2).to_not be_valid
    end

    it 'does not create a user if password is missing' do
      user2 = User.new(name: 'test_user', email: 'test@test.com', password: '', password_confirmation: 'password')
      expect(user2).to_not be_valid
    end

    it 'validates uniqueness of emails' do
      user1 = User.create(name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password')
      user2 = User.create(name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password')
      expect(user1).to be_valid
      expect(user2).to_not be_valid
    end
  end
end
