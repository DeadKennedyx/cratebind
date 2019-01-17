require 'rails_helper'

RSpec.describe ProjectsController do
  it 'renders correct template' do
    project = create(:project)
    user = create(:user, email: 'test1@test.com')
    sign_in user
    get :index
    expect(response).to render_template(:index)
    expect(response).to be_successful
    expect(assigns(:projects)).to eq([project])
  end

  it 'updates a project' do
    project = create(:project, name: 'previous')
    user = create(:user, email: 'test1@test.com')
    sign_in user
    patch :update, params: {id: project.id, project: {name: "changed"}}, format: :js
    project.reload
    expect(response).to be_successful
    expect(project.name).to eq('changed')
  end

  it 'removes a project' do
    project = create(:project)
    user = create(:user, email: 'test1@test.com')
    sign_in user
    expect(Project.count).to eq(1)
    delete :destroy, params: {id: project.id}, format: :js
    expect(response).to be_successful
    expect(Project.count).to eq(0)
  end

end
