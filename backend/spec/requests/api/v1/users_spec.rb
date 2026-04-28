# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'API V1 Users', type: :request do
  path '/api/v1/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string, format: :email },
              password: { type: :string },
              password_confirmation: { type: :string }
            },
            required: %w[email password password_confirmation]
          }
        },
        required: [ 'user' ]
      }

      response '201', 'user created' do
        let(:user) do
          {
            user: {
              email: 'new.user@example.com',
              password: 'password123',
              password_confirmation: 'password123'
            }
          }
        end

        schema type: :object,
          properties: {
            id: { type: :integer },
            email: { type: :string, format: :email },
            created_at: { type: :string, format: 'date-time' },
            updated_at: { type: :string, format: 'date-time' }
          },
          required: %w[id email created_at updated_at],
          additionalProperties: false

        run_test! do |response|
          body = JSON.parse(response.body)

          expect(body['email']).to eq('new.user@example.com')
          expect(User.find(body['id']).email).to eq('new.user@example.com')
        end
      end

      response '422', 'invalid request' do
        let(:user) do
          {
            user: {
              email: 'new.user@example.com',
              password: 'password123',
              password_confirmation: 'not-a-match'
            }
          }
        end

        schema type: :object,
          properties: {
            error_class: { type: :string },
            error_message: { type: :string }
          },
          required: %w[error_class error_message]

        run_test! do |response|
          body = JSON.parse(response.body)

          expect(body['error_class']).to eq('ActiveRecord::RecordInvalid')
          expect(body['error_message']).to include("Password confirmation doesn't match Password")
        end
      end
    end
  end

  path '/api/v1/users/{id}' do
    parameter name: :id, in: :path, type: :string, description: 'User ID'

    patch 'Updates a user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string, format: :email },
              password: { type: :string },
              password_confirmation: { type: :string }
            }
          }
        },
        required: [ 'user' ]
      }

      let!(:existing_user) do
        User.create!(
          email: 'existing.user@example.com',
          password: 'password123',
          password_confirmation: 'password123'
        )
      end

      response '200', 'user updated' do
        let(:id) { existing_user.id }
        let(:user) do
          {
            user: {
              email: 'updated.user@example.com'
            }
          }
        end

        schema type: :object,
          properties: {
            id: { type: :integer },
            email: { type: :string, format: :email },
            password_digest: { type: :string },
            created_at: { type: :string, format: 'date-time' },
            updated_at: { type: :string, format: 'date-time' }
          },
          required: %w[id email password_digest created_at updated_at]

        run_test! do |response|
          body = JSON.parse(response.body)

          expect(body['email']).to eq('updated.user@example.com')
          expect(existing_user.reload.email).to eq('updated.user@example.com')
        end
      end

      response '422', 'invalid request' do
        let(:id) { existing_user.id }
        let(:user) do
          {
            user: {
              password: 'new-password',
              password_confirmation: 'mismatch'
            }
          }
        end

        schema type: :object,
          properties: {
            error_class: { type: :string },
            error_message: { type: :string }
          },
          required: %w[error_class error_message]

        run_test! do |response|
          body = JSON.parse(response.body)

          expect(body['error_class']).to eq('ActiveRecord::RecordInvalid')
          expect(body['error_message']).to include("Password confirmation doesn't match Password")
        end
      end
    end

    delete 'Deletes a user' do
      tags 'Users'

      let!(:existing_user) do
        User.create!(
          email: 'delete.user@example.com',
          password: 'password123',
          password_confirmation: 'password123'
        )
      end

      response '204', 'user deleted' do
        let(:id) { existing_user.id }

        run_test! do |_response|
          expect(User.exists?(existing_user.id)).to be(false)
        end
      end
    end
  end
end
