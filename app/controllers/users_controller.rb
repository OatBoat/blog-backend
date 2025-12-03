class UsersController < ApplicationController
  def create
    post = Post.new(
      user: params[:user],
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if post.save
      render json: post
    else
      render json: { errors: post.errors.full_messages }, status: :bad_request
    end
  end
end
