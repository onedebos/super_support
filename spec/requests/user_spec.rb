# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'successful signups' do
    params = { name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password' }
    headers = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
    it 'signs up a user and send back a response if the inputs are valid' do
      post '/api/v1/users', params: params.to_json, headers: headers
      json_response = JSON.parse(response.body)
      expect(json_response['user']['name']).to eq('test_user')
      expect(json_response['user']['email']).to eq('test@test.com')
      expect(json_response['user']['role']).to eq('customer')
    end

    it 'returns a status of 201 if a sign up is successful' do
      post '/api/v1/users', params: params.to_json, headers: headers
      expect(response).to have_http_status(201)
      expect(response.body).to include('token')
    end

    it 'tests that an admin can make another user an admin' do
      # create a user
      params = { name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password' }
      headers = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
      post '/api/v1/users', params: params.to_json, headers: headers
      user1 = JSON.parse(response.body)
      # create another user
      params = { name: 'test_user', email: 'test2@test.com', password: 'password', password_confirmation: 'password' }
      headers = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
      post '/api/v1/users', params: params.to_json, headers: headers
      user2 = JSON.parse(response.body)

      # make user1 an admin

      user1 = User.find(user1['user']['user_id'])
      user1.update(role: 'admin')

      # login the user1
      login_params = { email: user1.email, password: 'password' }
      post '/api/v1/login', params: login_params
      user1 = JSON.parse(response.body)

      # make user2 an admin
      admin_params = { role: 'admin' }
      headers = { 'Accept': 'application/json', 'Content-Type': 'application/json', 'Authorization': "Bearer #{user1['token']}" }
      put '/api/v1/users/2', params: admin_params.to_json, headers: headers
      admin_response = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(response.body).to include('Successfully made user an admin.')
    end
  end
end
