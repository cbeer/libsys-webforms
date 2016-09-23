###
# Controller to handle the Encumberances Report
###
class ExpenditureReportsController < ApplicationController
  def new
    @expenditure_report = ExpenditureReport.new
  end

  def create
    @expenditure_report = ExpenditureReport.new(batch_params)
    if @expenditure_report.save
      flash[:success] = 'Report requested!'
      redirect_to root_path
    else
      flash[:warning] = 'Check that all form fields are entered!'
      render action: 'new'
    end
  end

  def batch_params
    params.require(:expenditure_report).permit!
  end
end
