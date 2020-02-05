# Class to manage the current user's ability to access views
class Ability
  include CanCan::Ability

  def initialize(current_user)
    current_user ||= AuthorizedUser.new
    assign_staff_specified_permission(current_user)
    assign_staff_manage_permission(current_user)
    assign_staff_create_permission(current_user)
    assign_staff_read_permission(current_user)
    assign_admin_permission(current_user)
    assign_basic_permission
    alias_action :completed, :menu, :queue, :recent, to: :read
  end

  def assign_basic_permission # must be authenticated
    can :manage, Ckey2bibframe
    can :manage, SsdsRequest
    can :read, BatchRecordUpdate
  end

  def assign_staff_specified_permission(current_user)
    can %i[read generate_number generate_number_form], AccessionNumber if /A|Y/.match?(current_user.accession_number)
    can %i[read create destroy add_batch], DigitalBookplatesBatch if /A|Y/.match?(current_user.digital_bookplates)
    can %i[create read], Sal3BatchRequestsBatch if /A|Y/.match?(current_user.sal3_batch_req)
    can %i[read update download], Sal3BatchRequestsBatch if /A|Y/.match?(current_user.sal3_breq_edit)
  end

  def assign_staff_create_permission(current_user)
    can :create, UserloadRerun if /A|Y/.match?(current_user.userload_rerun)
    can :create, IlliadUserExport if /A|Y/.match?(current_user.illiad_user_export)
  end

  def assign_staff_read_permission(current_user)
    can :read, %i[EdiErrorReport EdiInvoice EdiLin] if /A|Y/.match?(current_user.edi_inv_view)
    can :read, Package if /A|Y/.match?(current_user.package_manage)
    can :read, PackageFile if /A|Y/.match?(current_user.package_manage)
  end

  def assign_staff_manage_permission(current_user)
    can :manage, AccessionNumberUpdate if /A|Y/.match?(current_user.accession_number)
    assign_batch_permission if /A|Y/.match?(current_user.unicorn_updates)
    can :manage, %i[EdiErrorReport EdiInvLine EdiInvoice EdiLin] if /A|Y/.match?(current_user.edi_inv_manage)
    can :manage, LobbytrackReport if /A|Y/.match? current_user.lobbytrack_report
    assign_mgt_rpts_permission if /A|Y/.match?(current_user.mgt_rpts)
  end

  def assign_admin_permission(current_user)
    can :manage, AccessionNumber if /A/.match?(current_user.accession_number)
    app = AuthorizedUsersController.helpers.administrator_apps(current_user)
    can :manage, AuthorizedUser if app.any?
    can :delete_batch, DigitalBookplatesBatch if /A/.match?(current_user.digital_bookplates)
    can :manage, Package if /A/.match?(current_user.package_manage)
    if dev_test_env? && /A/ =~ current_user.package_manage
      can %i[run_tests list_transfer_logs], Package
    else
      cannot %i[run_tests list_transfer_logs], Package
      can :read, TestPackage if /A/.match?(current_user.package_manage)
    end
    can :read, VndRunlog if /A/.match?(current_user.package_manage)
  end

  def assign_batch_permission
    can :manage, BatchRecordUpdate
    can :manage, ChangeCurrentLocation
    can :manage, ChangeHomeLocation
    can :manage, ChangeItemType
    can :manage, TransferItem
    can :manage, UniUpdatesBatch
    can :manage, WithdrawItem
  end

  def assign_mgt_rpts_permission
    can :manage, CirculationStatisticsReport
    can :manage, EncumbranceReport
    can :manage, EndowedFundsReport
    can :manage, %i[ExpenditureReport ExpendituresWithCircStatsReport]
    can :manage, ManagementReport
    can :manage, %i[ShelfSelectionReport ShelfSelSearch]
  end

  def dev_test_env?
    return true if Rails.env.development? || Rails.env.test?
  end
end
