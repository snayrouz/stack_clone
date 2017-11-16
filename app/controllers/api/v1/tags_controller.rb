class Api::V1::TagsController < ApplicationController

  def index
    render json: Tag.all
  end

  def show
    render json: Tag.find(params[:id])
  end

  def create
    render json: Tag.create(tag_params)
  end

  def update
    render json: Tag.update(tag_params)
  end

  def destroy
    render json: Tag.delete(params[:id])
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end



end
