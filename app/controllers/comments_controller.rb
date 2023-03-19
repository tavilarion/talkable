# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_project

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params.merge(project_id: params[:project_id]))

    if @comment.save
      respond_to(&:turbo_stream)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
