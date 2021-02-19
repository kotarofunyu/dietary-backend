class TagsController < ApplicationController
  before_action :set_tag, only: %i[update destroy]

  def index
    @tags = Tag.where(user_id: @current_user.id)
    render json: @tags, status: :ok
  end

  def create
    @tag = Tag.new(tags_params)
    if @tag.save
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tag.update(tags_params)
      render json: @tag, status: :ok
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @tag.destroy
      head :ok
    else
      head :bad_request
    end
  end

  private

  def set_tag
    @tag = Tag.find_by(id: params[:id], user_id: @current_user.id)
  end

  def tags_params
    params.require(:tag).permit(:name).merge(user_id: @current_user.id)
  end
end
