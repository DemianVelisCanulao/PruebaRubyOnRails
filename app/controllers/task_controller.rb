class TaskController < ApplicationController
    before_action :set_proyecto
  before_action :set_tarea, only: [:show, :edit, :update, :destroy]

  def create
    @tarea = @proyecto.tareas.build(tarea_params)
    if @tarea.save
      redirect_to @proyecto, notice: 'Tarea creada exitosamente.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tarea.update(tarea_params)
      redirect_to @proyecto, notice: 'Tarea actualizada exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @tarea.destroy
    redirect_to @proyecto, notice: 'Tarea eliminada exitosamente.'
  end

  private

  def set_proyecto
    @proyecto = current_user.proyectos.find(params[:proyecto_id])
  end

  def set_tarea
    @tarea = @proyecto.tareas.find(params[:id])
  end

  def tarea_params
    params.require(:tarea).permit(:nombre, :descripcion, :completada)
  end

end
