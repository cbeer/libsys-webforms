# Controller to handle Edi Error Report requests
class EdiErrorReportsController < ApplicationController
  has_scope :day
  has_scope :level
  has_scope :type

  def index
    authorize! :read, @edi_error_report if can? :read, @edi_error_report
    @edi_error_report = apply_scopes(EdiErrorReport.order(run: :desc)).all
  rescue StandardError => e
    flash[:error] = e.message
    redirect_to edi_error_reports_path
  end
end
