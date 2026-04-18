module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[ update destroy ]

      # POST /api/v1/users
      def create
        @user = User.new(user_params)
        @user.save!
        render json: @user, status: :created
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
        params.expect(user: [ :email, :password, :password_confirmation ])
      end
    end
  end
end
