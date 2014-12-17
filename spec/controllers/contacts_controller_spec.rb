require 'rails_helper'

describe ContactsController do

  # Devise Log in
  login_user

  # Show --------------------------------------------
  describe 'GET #show' do

    it 'renders the :show template for the Contact' do
      project = create(:project)
      contact = create(:contact, project: project)
      get :show, id: contact, project_id: project.id
      expect(response).to render_template :show
    end

  end

end
