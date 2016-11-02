class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params.fetch(:id))
  end

  def single_task
    @task = Task.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
end
