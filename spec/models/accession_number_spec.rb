require 'rails_helper'

RSpec.describe AccessionNumber, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:accession_number)).to be_valid
  end
end
