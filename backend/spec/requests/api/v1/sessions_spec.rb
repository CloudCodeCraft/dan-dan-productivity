# frozen_string_literal : true
require 'swagger_helper'

RSpec.describe 'API V1 Sessions' do
  path '/api/v1/sessions' do
    post 'Creates a session' do
      tags 'Sessions'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string, format: :email },
              password: { type: :string }
            },
            required: %w[email password]
          }
        },
        required: [ "user" ]
      }

      response '200', 'session created' do
        let(:created_user) { create(:user) }
        let(:user) do
          { user: { email: created_user.email, password: 'password123' } }
        end

        schema type: :object,
          properties: {
            id: { type: :integer },
            bearer_token: { type: :string },
            user_id: { type: :interger },
            created_at: { type: :string, format: 'date-time' },
            updated_at: { type: :string, format: 'date-time' }
          },
          required: %w[id bearer_token user_id created_at updated_at],
          additonalProperties: false

        run_test! do |response|
          body = JSON.parse(response.body)

          expect(body['user_id']).to eq(created_user.id)
        end
      end
    end
  end
end
