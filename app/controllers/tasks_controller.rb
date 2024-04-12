class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to root_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.content = params[:task][:content]
    if @task.save
      redirect_to root_path
    else
      render 'tasks/edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def task_params
      params.require(:task).permit(:content)
    end

  end
