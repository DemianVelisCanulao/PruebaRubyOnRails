class ProjectController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = current_user.project
    end

    def show
        @tasks = @project.task
    end

    def new
        @project = Project.new
        @user_projects = current_user.project
    end

    def create
        @projects = current_user.project.build(project_params)

        if @projects.save
            redirect_to @projects, notice: 'Proyecto creado exitosamente.'
        else
            flash.now[:error] = 'El campo título no puede estar vacío'
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @project.update(project_params)
            redirect_to @project, notice: 'Proyecto actualizado exitosamente.'
        else
            flash.now[:error] = 'El campo título no puede estar vacío'
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @project.destroy
        redirect_to project_url, notice: 'Proyecto eliminado exitosamente.'
    end

    private

    def set_project
        @project = current_user.project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:title)
    end
end
