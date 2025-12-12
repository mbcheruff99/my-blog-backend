class TagsController < ApplicationController

  def index
    @tags = Tag.all.order(:id)
    render :index
  end

  def show
    @tag = Tag.find(params[:id])
    render :show
  end

  def create
    @tag = Tag.new(
      name: params[:name]
    )
    if @tag.save
      render :show
    else
      render json: { errors: @tag.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.name = params[:name] || @tag.name
    if @tag.save
      render :show
    else 
      render json: { errors: @tag.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.delete
    render json: { message: "Tag successfully destroyed "}
  end

end
