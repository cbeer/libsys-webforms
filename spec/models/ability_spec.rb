# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

def basic_abilities
  [Ckey2bibframe, SsdsRequest]
end

def staff_specified_abilties
  [AccessionNumber, DigitalBookplatesBatch, Sal3BatchRequestsBatch, Sal3BatchRequestsBatch]
end

def staff_create_abilities
  [IlliadUserExport, UserloadRerun]
end

def staff_read_abilities
  [BatchRecordUpdate, EdiErrorReport, EdiInvoice, EdiLin, Package, PackageFile]
end

def staff_manage_abilities
  [AccessionNumberUpdate, BatchRecordUpdate, ChangeCurrentLocation, ChangeHomeLocation, ChangeItemType,
   CirculationStatisticsReport, EdiErrorReport, EdiInvLine, EdiInvoice, EdiLin, EncumbranceReport,
   EndowedFundsReport, ExpenditureReport, ExpendituresWithCircStatsReport, LobbytrackReport,
   ManagementReport, ShelfSelSearch, ShelfSelectionReport, TransferItem, UniUpdatesBatch, WithdrawItem]
end

def admin_abilities
  [AccessionNumber, AuthorizedUser, DigitalBookplatesBatch, Package, TestPackage, VndRunlog]
end


RSpec.describe Ability do
  subject { ability }

  let(:ability) { described_class.new(user) }
  let(:user) { nil }

  context 'with authenticated login only' do
    let(:user) { FactoryBot.create(:blank_user) }
    basic_abilities.each do |r|
      it { is_expected.to be_able_to(:manage, r.new) }
    end
    it { is_expected.to be_able_to(:read, BatchRecordUpdate.new) }
  end

  # context 'with no abilities in authorized user table' do
  #   let(:user) { FactoryBot.create(:blank_user) }
  #
  #   staff_abilities.each do |r|
  #     it { is_expected.not_to be_able_to(:manage, r.new) }
  #   end
  # end
  #
  context 'with staff read abilities' do
    let(:user) { FactoryBot.create(:staff_user) }

    staff_read_abilities.each do |r|
      it { is_expected.to be_able_to(:read, r.new) }
    end
  end
  #
  # context 'with admin manage abilities' do
  #   let(:user) { FactoryBot.create(:admin_user) }
  #
  #   staff_abilities.each do |r|
  #     it { is_expected.to be_able_to(:read, r.new) }
  #   end
  # end
end
