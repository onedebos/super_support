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

    it 'returns a status of 201 is a sign up is successful' do
      post '/api/v1/users', params: params.to_json, headers: headers
      expect(response).to have_http_status(201)
      expect(response.body).to include('token')
    end
  end
end
