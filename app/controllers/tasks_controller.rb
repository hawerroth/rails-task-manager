class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path
  end

  def edit; end

  def update
    @task.update(task_params)

    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    # para colocar permissao somete para pegar as infos que realmente queremos, e nao aparecer nenhuma informcao desnecessaria
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
