module Api
  module V1
    class SessionsController < ApplicationController
      def create
        render json: SessionCreationService.run!(email: create_params[:email], password: create_params[:password])
      end

      def destroy
      end

      private

      def create_params
        debugger
        params.expect(user: [:email, :password])
      end
    end
  end
end
