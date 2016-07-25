require 'rails_helper'

RSpec.describe CirculationStatisticsReportsController, type: :controller do
  describe 'get#new' do
    it 'renders the correct template' do
      stub_current_user(FactoryGirl.create(:authorized_user))
      get 'new'
      expect(response).to render_template('new')
    end
  end

  describe 'post#create' do
    it 'redirects to root_url' do
      stub_current_user(FactoryGirl.create(:authorized_user))
      post :create, circulation_statistics_report: { email: '' }
      expect(response).to redirect_to root_url
    end
  end

  describe 'get#home_locations' do
    it 'returns a 200 response code' do
      stub_current_user(FactoryGirl.create(:authorized_user))
      xhr :get, :home_locations
      expect(response.status).to eq(200)
    end
  end
end
