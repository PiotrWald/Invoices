# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe 'navigation' do
  it 'should be possible to visit root' do
    visit '/'
    expect(page.status_code).to eq(200)
  end

  it 'should be possible to visit invoices' do
    visit '/invoices'
    expect(page.status_code).to eq(200)
  end

  it 'should be possible to visit invoices' do
    visit '/invoices'
    expect(page.status_code).to eq(200)
  end

  it 'should be possible to visit current invoice' do
    invoice = Invoice.create
    visit "invoices/#{invoice.id}"
    expect(page.status_code).to eq(200)
  end
end
