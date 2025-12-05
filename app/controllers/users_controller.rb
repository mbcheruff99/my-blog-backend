class UsersController < ApplicationController

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      admin: params[:admin]
    )

    if user.save
      render json: { message: "User successfuly created" }, status: :created
    else
      render json: { errors: user.errors }, status: :bad_request 
    end
  end


  def destroy
    user = User.find(params[:id])
    user.delete
    render json: { message: "User successfully delted" }
  end
end
