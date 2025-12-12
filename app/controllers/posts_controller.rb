class PostsController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_post_owner, only: [:update, :destroy]


  def index
    @posts = Post.all.order(:id)
    render :index
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def create
    @post = Post.new(
      title: params[:title],
      body: params[:body],
      image: params[:image],
      user_id: current_user.id
    )
    if @post.save
      render :show
    else
      render json: { errors: @post.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title] || @post.title
    @post.body = params[:body] || @post.body
    @post.image = params[:image] || @post.image
    @post.user_id = params[:user_id] || @post.user_id
    if @post.save
      render :show
    else
      render json: { errors: @post.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    render json: { message: "Post successfully destroyed!" }
  end
end
