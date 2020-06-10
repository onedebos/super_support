# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe '#test if a ticket is valid' do
    let(:user) { User.create(name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password') }
    let(:ticket) { Ticket.create(user_id: user.id, title: 'test ticket', request: 'this is a test request') }

    it 'creates a ticket if all fields exist' do
      expect(ticket).to be_valid
    end

    it 'sets ticket status to open when a new ticket is created' do
      expect(ticket.status).to eq('opened')
    end

    describe '#when a ticket is invalid' do
      it 'does not create a ticket if userId is missing' do
        user = User.create(name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password')
        ticket = Ticket.create(user_id: '', title: 'test ticket', request: 'this is a test request')
        expect(ticket).to_not be_valid
      end

      it 'does not create a ticket if title is missing' do
        user = User.create(name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password')
        ticket = Ticket.create(user_id: user.id, title: '', request: 'this is a test request')
        expect(ticket).to_not be_valid
      end
    end
  end
end
