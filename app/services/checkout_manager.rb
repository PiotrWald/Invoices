# frozen_string_literal: true

class CheckoutManager
  def initialize(invoice)
    @invoice = invoice
  end

  def close_invoice
    return false if @invoice.invoices_products.count.zero?
    Invoice.update(@invoice.id, number: generate_number, status: :closed)
  end

  private

  def generate_number
    date = Time.zone.today.strftime('%Y/%m/')
    count = Invoice.where('number like ?', "%#{date}%").count

    if count.zero?
      date + '1'
    else
      date + (count + 1).to_s
    end
  end
end
