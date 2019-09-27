require 'rails_helper'

RSpec.describe TestPackagesController, type: :controller do
  describe 'get#show' do
    let(:test_package) { FactoryBot.create(:test_package) }

    before do
      stub_current_user(FactoryBot.create(:admin_user))
    end

    it 'redirects to the new packages path with a package id' do
      get :show, params: { package_id: test_package.package_id }
      expect(response).to redirect_to "/packages/new?package_id=#{test_package.package_id}"
    end
  end
end
