# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'login tests' do
    it 'tests that a user with valid credential can login' do
      # create a user
      params = { name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password' }
      headers = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
      post '/api/v1/users', params: params.to_json, headers: headers
      user = JSON.parse(response.body)

      # login the user
      login_params = { email: 'test@test.com', password: 'password' }
      post '/api/v1/login', params: login_params
      user = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(response.body).to include('token')
    end

    it 'tests that a user with invalid credentials cannot login' do
      # create a user
      params = { name: 'test_user', email: 'test@test.com', password: 'password', password_confirmation: 'password' }
      headers = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
      post '/api/v1/users', params: params.to_json, headers: headers
      user = JSON.parse(response.body)

      # login the user
      login_params = { email: 'test@test.com', password: 'wrong_password' }
      post '/api/v1/login', params: login_params
      user = JSON.parse(response.body)
      expect(response).to have_http_status(401)
      expect(response.body).to include(
        'invalid email or password'
      )
    end
  end
end
