require 'rails_helper'

describe ProjectsController do

  # Devise Log in
  login_user

  # Index -------------------------------------------
  describe 'GET #index' do
    it 'assigns all projects as @projects' do
      project_1 = create(:project, name: 'Project 1')
      project_2 = create(:project, name: 'Project 2')
      get :index
      expect(assigns(:projects)).to match_array([project_1, project_2])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  # Show --------------------------------------------
  describe 'GET #show' do
    it 'assigns the requested project as @project' do
      project = create(:project)
      get :show, id: project
      expect(assigns(:project)).to eq project
    end

    it 'renders the :show template' do
      project = create(:project)
      get :show, id: project
      expect(response).to render_template :show
    end
  end

  # New ---------------------------------------------
  describe 'GET #new' do
    it 'assigns a new project as @project' do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  # Edit --------------------------------------------
  describe 'GET #edit' do
    it 'assigns the requested project as @project' do
      project = create(:project)
      get :edit, id: project
      expect(assigns(:project)).to eq project
    end

    it 'renders the :edit template' do
      project = create(:project)
      get :edit, id: project
      expect(response).to render_template :edit
    end
  end

  # Create ------------------------------------------
  describe 'POST #create' do

    context 'with valid params' do
      it 'creates a new Project' do
        expect{
          post :create, project: attributes_for(:project)
        }.to change(Project, :count).by(1)
      end

      it 'redirects to the created project' do
        post :create, project: attributes_for(:project)
        expect(response).to redirect_to project_path(assigns[:project])
      end
    end

    context 'with invalid params' do
      it 'does not save the new project in the database' do
        expect{
          post :create, project: attributes_for(:invalid_project)
        }.to_not change(Project, :count)
      end

      it 're-renders the :new template' do
        post :create, project: attributes_for(:invalid_project)
        expect(response).to render_template :new
      end
    end
  end

  # Update ------------------------------------------
  describe 'PATCH #update' do

    before :each do
      @project = create(:project, name: 'Testing Project')
    end

    context 'with valid params' do
      it 'locates the requested @project' do
        patch :update, id: @project, project: attributes_for(:project)
        expect(assigns(:project)).to eq(@project)
      end
      it 'updates the requested project' do
        patch :update, id: @project, project: attributes_for(:project, name: 'Project 2')
        @project.reload
        expect(@project.name).to eq('Project 2')
      end
      it 'redirects to the project' do
        patch :update, id: @project, project: attributes_for(:project)
        expect(response).to redirect_to @project
      end
    end

    context 'with invalid params' do
      it 'does not change the projects attributes' do
        patch :update, id: @project, project: attributes_for(:invalid_project)
        @project.reload
        expect(@project.name).to eq('Testing Project')
      end
      it 're-renders the :edit template' do
        patch :update, id: @project, project: attributes_for(:invalid_project)
        expect(response).to render_template :edit
      end
    end
  end

  # Destroy -----------------------------------------
  describe 'DELETE #destroy' do

    before :each do
      @project = create(:project)
    end

    it 'destroys the requested project' do
      expect{
        delete :destroy, id: @project
      }.to change(Project, :count).by(-1)
    end
    it 'redirects to project#index' do
      delete :destroy, id: @project
      expect(response).to redirect_to projects_url
    end
  end

end
