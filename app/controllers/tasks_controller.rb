class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:notice] = "タスクが追加されました"
      redirect_to root_path
    end
  end

  private
    def task_params
      params.require(:task).permit(:content)
    end

  end
