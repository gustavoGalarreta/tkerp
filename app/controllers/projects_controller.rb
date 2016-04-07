class ProjectsController < ApplicationController
  load_and_authorize_resource :except => :tasks
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_teams, only: [:new, :create, :edit, :update]
  before_action :set_clients, only: [:new, :create, :edit, :update]
  before_action :set_tasks, only: [:new, :create, :edit, :update]
  add_breadcrumb "Projects", :projects_path

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @collaborators = Collaborator.where(team: params[:team_id])
    @project = Project.new
    @project.task_projects.build
  end

  def edit
    @collaborators = Collaborator.where(team: @project.team_id)
    add_breadcrumb "Edit", :edit_project_path
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        add_collaborators(@project)
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project.collaborator_projects.delete_all
    respond_to do |format|
      if @project.update(project_params)
        add_collaborators(@project)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    @project.stop_timesheets
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  def add_collaborators project
    params.keys.each { |current_param|
      if current_param.include? "collaborator"
        @project.collaborators.push(Collaborator.find(params[current_param].to_i))
      end
    }
  end

  private
    def set_tasks
      @tasks = Task.all
    end
    def set_teams
      @teams = Team.all
    end
    def set_clients
      @clients = Client.all    
    end
    def set_project
      @project = Project.find(params[:id])
    end
    def project_params
      params.require(:project).permit(:name, :client_id, :description, :team_id,task_projects_attributes: [:id, :task_id, :_destroy])
    end
end
