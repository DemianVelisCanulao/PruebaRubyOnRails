class TasksController < ApplicationController

  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def create
    @task = @project.task.build(task_params)
    if @task.save
      redirect_to @project, notice: 'Tarea creada exitosamente.'
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream do
          render turbo_stream: turbo_stream.append('flash_messages', partial: 'shared/flash_message', locals: { message: 'El campo no puede estar vacío.' })
        end

      end
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = @project.task.build
  end

  def edit
    respond_to do |format|
      format.html { render layout: false }
      format.turbo_stream
    end
  end

  def update
    if @task.update(task_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@task, partial: "tasks/task", locals: { task: @task }) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@task, partial: "tasks/task_errors", locals: { task: @task }) }
      end
    end
  end

  def destroy
    @task.destroy
    render turbo_stream: [
      turbo_stream.remove(@task),
      turbo_stream.append('flash_messages', partial: 'shared/flash_message', locals: { message: 'La tarea ha sido eliminada.' })
    ]
  end

  private

  def set_project
    @project = current_user.project.find(params[:project_id])
  end

  def set_task
    @task = @project.task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end

end
