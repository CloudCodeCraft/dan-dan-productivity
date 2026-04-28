module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[update destroy]

      def create
        user = UserCreationService.run!(
          email: user_params[:email],
          password: user_params[:password],
          password_confirmation: user_params[:password_confirmation]
        )
        render json: user.attributes.except(:password_digest), status: :created
      end

      # PATCH/PUT /api/v1/users/1
      def update
        @user.update!(user_params)
        render json: @user 
      end

      # DELETE /api/v1/users/1
      def destroy
        @user.destroy!
      end

      private

      def set_user
        @user = User.find(params.expect(:id))
      end

      def user_params
        params.expect(user: %i[email password password_confirmation])
      end
    end
  end
end
