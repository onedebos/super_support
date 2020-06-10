# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe '# valid comments' do
    it 'tests that an authenticated user can create comments' do
      # create a user
      params = { name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password' }
      headers = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
      post '/api/v1/users', params: params.to_json, headers: headers
      user = JSON.parse(response.body)

      # create a ticket
      ticket_params = { user_id: user['user']['user_id'], title: 'test ticket', request: 'this is a test request' }
      headers = { 'Accept': 'application/json', 'Content-Type': 'application/json', 'Authorization': "Bearer #{user['token']}" }
      post '/api/v1/tickets', params: ticket_params.to_json, headers: headers
      tickets = JSON.parse(response.body)
      

      # create a comment
      comment_params = { user_id: user['user']['user_id'], user_name: user['user']['name'], ticket_id: tickets['ticket']['id'], comment: 'test comment' }
      headers = { 'Accept': 'application/json', 'Content-Type': 'application/json', 'Authorization': "Bearer #{user['token']}" }
      post "/api/v1/tickets/#{tickets['ticket']['id']}/comments", params: comment_params.to_json, headers: headers
      comments_response = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(response.body).to include('test comment')
    end

    describe 'invalid comments' do
      it 'tests that an unauthorized user cannot create comments' do
        # create a user
        params = { name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password' }
        headers = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
        post '/api/v1/users', params: params.to_json, headers: headers
        user = JSON.parse(response.body)

        # create a ticket
        ticket_params = { user_id: user['user']['user_id'], title: 'test ticket', request: 'this is a test request' }
        headers = { 'Accept': 'application/json', 'Content-Type': 'application/json', 'Authorization': "Bearer #{user['token']}" }
        post '/api/v1/tickets', params: ticket_params.to_json, headers: headers
        tickets = JSON.parse(response.body)

        # create a comment
        comment_params = { user_id: user['user']['user_id'], user_name: user['user']['name'], ticket_id: tickets['ticket']['id'], comment: 'test comment' }
        headers = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
        post "/api/v1/tickets/#{tickets['ticket']['id']}/comments", params: comment_params.to_json, headers: headers
        comments_response = JSON.parse(response.body)

        expect(response).to have_http_status(401)
        expect(response.body).to include('not authorized')
      end
    end
  end
end
