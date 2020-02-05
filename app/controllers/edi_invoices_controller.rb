# Controller for EdiInvoice management
class EdiInvoicesController < ApplicationController
  load_resource
  has_scope :vendfilter

  def menu; end

  def index
    authorize! :read, @edi_invoice if can? :read, @edi_invoice
    @edi_invoice = apply_scopes(EdiInvoice).all
  end

  def update
    authorize! :manage, @edi_invoice if can? :manage, @edi_invoice
    @message = EdiInvoice.make_updates(params[:vendors], params[:invoice_number])
    flash[@message[0].to_sym] = @message[1]

    redirect_to edi_invoices_menu_path
  end

  def change_invoice_line
    authorize! :manage, @edi_inv_line if can? :manage, @edi_inv_line
    @edi_inv_line = EdiInvLine.where("todo = 'CreOrd'")
    respond_to do |format|
      format.js # modal window: chane_invoice_line.js.erb
    end
  end

  def invoice_exclude
    authorize! :manage, @edi_invoice if can? :manage, @edi_invoice
    @edi_invoice = EdiInvoice.all
    respond_to do |format|
      format.js # modal window: invoice_exclude.js.erb
    end
  end
end
