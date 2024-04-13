class TasksController < ApplicationController
  before_action :logged_in?

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
    if @task.update(task_params)
      redirect_to root_path
    else
      render 'tasks/edit', status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # redirect_to root_path, status: :see_other
  end

  def done
    @task = Task.find(params[:id])
      if @task.done
        @task.done = false
      else
        @task.done = true
      end


    respond_to do |format|

      format.turbo_stream {@task.update(task_params)}
    end
  end

  private
    def task_params
      params.require(:task).permit(:content, :done)
    end

    def logged_in?
      unless user_signed_in?
        flash[:alert] = "ログインしてください"
        redirect_to root_path
      end
    end
  end
