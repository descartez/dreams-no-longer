class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = Task.all.reverse
  end

  def show
    @task = Task.find(params.fetch(:id))
  end

  def new
    @task = Task.new
    respond_to do |format|
      format.js
    end
  end

  def create
    p post = params.fetch(:post)
    @task = Task.create(title: post.fetch(:title), task: post.fetch(:task))
    @tasks = Task.all.reverse
    p @task
  end

  def destroy
    @task = Task.find(params.fetch(:id).to_i)
    p @task
    @task.destroy
    @tasks = Task.all.reverse
    respond_to do |format|
      format.js { render :template => 'tasks/destroy.js.erb', :layout => false }
    end
  end

  def single_task
    @task = Task.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def do_it_widget
  end
end
