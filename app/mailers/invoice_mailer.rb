class InvoiceMailer < ApplicationMailer
  def send_invoice
    @invoice = params[:invoice]
    @email = params[:email]

    mail(to: @email, subject: "Invoice #{@invoice.number}")
  end
end
