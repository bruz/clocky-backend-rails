require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProjectSessionsController do

  def mock_project_session(stubs={})
    @mock_project_session ||= mock_model(ProjectSession, stubs)
  end

  before(:each) do
    @mock_project = mock_model(Project)
    Project.should_receive(:find).with("23").and_return(@mock_project)
  end

  describe "GET index" do
    it "assigns all project_sessions as @project_sessions" do
      ProjectSession.stub!(:find).with(:all).and_return([mock_project_session])
      get :index, :project_id => "23"
      assigns[:project_sessions].should == [mock_project_session]
    end
  end

  describe "GET show" do
    it "assigns the requested project_session as @project_session" do
      ProjectSession.stub!(:find).with("37").and_return(mock_project_session)
      get :show, :id => "37", :project_id => "23"
      assigns[:project_session].should equal(mock_project_session)
    end
  end

  describe "GET new" do
    it "assigns a new project_session as @project_session" do
      ProjectSession.stub!(:new).and_return(mock_project_session)
      get :new, :project_id => "23"
      assigns[:project_session].should equal(mock_project_session)
    end
  end

  describe "GET edit" do
    it "assigns the requested project_session as @project_session" do
      ProjectSession.stub!(:find).with("37").and_return(mock_project_session)
      get :edit, :id => "37", :project_id => "23"
      assigns[:project_session].should equal(mock_project_session)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created project_session as @project_session" do
        ProjectSession.stub!(:new).with({'these' => 'params'}).
          and_return(mock_project_session(:save => true, :project_id= => true))
        post :create, :project_session => {:these => 'params'}, :project_id => "23"
        assigns[:project_session].should equal(mock_project_session)
      end

      it "redirects to the created project_session" do
        ProjectSession.stub!(:new).
          and_return(mock_project_session(:save => true, :project_id= => true))
        post :create, :project_session => {}, :project_id => "23"
        response.should redirect_to(project_url(@mock_project))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project_session as @project_session" do
        ProjectSession.stub!(:new).with({'these' => 'params'}).
          and_return(mock_project_session(:save => false, :project_id= => true))
        post :create, :project_session => {:these => 'params'}, :project_id => "23"
        assigns[:project_session].should equal(mock_project_session)
      end

      it "re-renders the 'new' template" do
        ProjectSession.stub!(:new).
          and_return(mock_project_session(:save => false, :project_id= => true))
        post :create, :project_session => {}, :project_id => "23"
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested project_session" do
        ProjectSession.should_receive(:find).with("37").and_return(mock_project_session(:end_time => true))
        mock_project_session.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :project_session => {:these => 'params'}, :project_id => "23"
      end

      it "assigns the requested project_session as @project_session" do
        ProjectSession.stub!(:find).and_return(mock_project_session(:update_attributes => true, :end_time => true))
        put :update, :id => "1", :project_id => "23"
        assigns[:project_session].should equal(mock_project_session)
      end

      it "redirects to the project_session" do
        ProjectSession.stub!(:find).and_return(mock_project_session(:update_attributes => true, :end_time => true))
        put :update, :id => "1", :project_id => "23"
        response.should redirect_to(project_url(@mock_project))
      end
    end

    describe "with invalid params" do
      it "updates the requested project_session" do
        ProjectSession.should_receive(:find).with("37").and_return(mock_project_session(:end_time => true))
        mock_project_session.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :project_session => {:these => 'params'}, :project_id => "23"
      end

      it "assigns the project_session as @project_session" do
        ProjectSession.stub!(:find).and_return(mock_project_session(:update_attributes => false, :end_time => true))
        put :update, :id => "1", :project_id => "23"
        assigns[:project_session].should equal(mock_project_session)
      end

      it "re-renders the 'edit' template" do
        ProjectSession.stub!(:find).and_return(mock_project_session(:update_attributes => false, :end_time => true))
        put :update, :id => "1", :project_id => "23"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested project_session" do
      ProjectSession.should_receive(:find).with("37").and_return(mock_project_session)
      mock_project_session.should_receive(:destroy)
      delete :destroy, :id => "37", :project_id => "23"
    end

    it "redirects to the project_sessions list" do
      ProjectSession.stub!(:find).and_return(mock_project_session(:destroy => true))
      delete :destroy, :id => "1", :project_id => "23"
      response.should redirect_to(project_url(@mock_project))
    end
  end

end
