class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = Task.all.reverse
  end

  def show
    @task = Task.find(params.fetch(:id))
    @tasks = Task.all.reverse
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

  def edit
    @task = Task.find(params.fetch(:id))
    respond_to do |format|
      format.js
    end
  end

  def update
    @task = Task.find(params.fetch(:id))
    p put = params.fetch(:put)
    @task.update_attribute(:title, put.fetch(:title))
    @task.update_attribute(:task, put.fetch(:task))
    @tasks = Task.all.reverse
    p @task
    respond_to do |format|
      format.js { render :template => 'tasks/edited_task.js.erb', :layout => false }
    end
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

  def finish_task
    p 'finished task mofos'
    @task = Task.find(params.fetch(:id))
    @task.finish_unfinish
    respond_to do |format|
      format.js { render :template => 'tasks/single_task.js.erb', :layout => false }
    end
  end
end
