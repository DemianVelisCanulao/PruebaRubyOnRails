class ProjectController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = current_user.project
    end

    def show

    end

    def new
        @project = Project.new 
    end

    def create 
        @project = current_user.projects.build(project_params)
        if project.save 
            redirect_to @project, notice: 'Proyecto creado exitosamente.'
        else
            render:new
        end        
    end

    def edit
    end
    
    def update
        if @project.update(project_params)
            redirect_to @project, notice: 'Proyecto actualizado exitosamente.'
        else
            render:edit
        end    
    end

    def destroy
        @project.destroy
        redirect_to projects_url, notice: 'Proyecto elimininado exitosamente.'
    end

    private 

    def set_project
        @project = current_user.projects.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:title)
    end
end
