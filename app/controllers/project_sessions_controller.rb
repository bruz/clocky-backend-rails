class ProjectSessionsController < ApplicationController
  before_filter :get_project

  # GET /project_sessions
  # GET /project_sessions.xml
  def index
    @project_sessions = @project ? @project.project_sessions : ProjectSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_sessions }
      format.json  { render :json => @project_sessions }
    end
  end

  # GET /project_sessions/1
  # GET /project_sessions/1.xml
  def show
    @project_session = ProjectSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_session }
      format.json  { render :json => @project_session }
    end
  end

  # GET /project_sessions/new
  # GET /project_sessions/new.xml
  def new
    @project_session = ProjectSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_session }
      format.json  { render :json => @project_session }
    end
  end

  # GET /project_sessions/1/edit
  def edit
    @project_session = ProjectSession.find(params[:id])
  end

  # POST /project_sessions
  # POST /project_sessions.xml
  def create
    @project_session = ProjectSession.new(params[:project_session])
    @project_session.project_id = @project.id if @project

    respond_to do |format|
      if @project_session.save
        format.html { redirect_to(@project) }
        format.xml  { render :xml => @project_session, :status => :created, :location => @project_session }
        format.json  { render :json => @project_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_session.errors, :status => :unprocessable_entity }
        format.json  { render :json => @project_session.errors }
      end
    end
  end

  # PUT /project_sessions/1
  # PUT /project_sessions/1.xml
  def update
    @project_session = ProjectSession.find(params[:id])
    @project_session.end_time ||= DateTime.now

    respond_to do |format|
      if @project_session.update_attributes(params[:project_session])
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
        format.json  { render :json => @project_session }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_session.errors, :status => :unprocessable_entity }
        format.json  { render :json => @project_session.errors }
      end
    end
  end

  # DELETE /project_sessions/1
  # DELETE /project_sessions/1.xml
  def destroy
    @project_session = ProjectSession.find(params[:id])
    @project_session.destroy

    respond_to do |format|
      format.html { redirect_to( project_url(@project) ) }
      format.xml  { head :ok }
      format.json  { render :json => @project_session }
    end
  end

  private

  def get_project
    @project = Project.find(params[:project_id]) if params[:project_id]
  end
end
