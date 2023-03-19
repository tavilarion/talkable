# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update]

  def index
    @projects = Project.all
  end

  def edit; end

  def show; end

  def update
    if @project.update(project_params)
      @comment = create_system_comment

      respond_to(&:turbo_stream)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:status)
  end

  def create_system_comment
    @project.comments.create(author: 'System', content: "Project status changed to ### #{@project.status} ###")
  end
end
