require 'swagger_helper'

describe 'Users API' do
    path '/api/v1/users' do
        get 'gets all users' do
            tags 'Users'
            produces 'application/json'
            
            response '200', 'users found' do
                schema type: :object,
                properties: {
                    id: {type: :integer},
                    name: {type: :string},
                    email: {type: :string},
                }
                run_test!
            end
        end

        post 'signs up a user' do
            tags 'Users'
            description 'Creates a new user with name, username and password'
            consumes 'application/json'
            parameter name: :user, in: :body, schema:{
                type: :object,
                properties: {
                    name: {type: :string},
                    email: {type: :string},
                    password: {type: :string},
                    password_confirmation: {type: :string}
                },
                required: ['name', 'email', 'password', 'password_confirmation']
            }
              
              

              response '201', 'user created' do
                let(:user) {{name: 'user1', email: 'user1@gmail.com', password: 'password', password_confirmation: 'password'}}
                run_test!
              end

              response '422', 'invalid request' do
                let(:user) {{name: '', email: ''}}
                run_test!
              end

        end
    end

end