# frozen_string_literal: true

require 'rails_helper'

describe 'creation' do
  it 'should be created with valid parameters' do
    product = Product.create(
      name: 'Valid Name',
      code: 'Valid Code',
      price: 0
    )
    expect(product.id).not_to be_nil
  end

  it 'should not be created with invalid parameters' do
    product = Product.create(
      name: nil,
      code: nil,
      price: -1
    )
    expect(product.id).to be_nil
  end
end

describe 'modyfing existing' do
  before :each do
    @product = Product.create(
      name: 'Valid Name',
      code: 'Valid Code',
      price: 0
    )
  end

  it 'should be updated with valid parameter' do
    @product.name = 'new'
    @product.save
    expect(Product.find(@product.id).name).to eq('new')
  end

  it 'should not be updated with invalid parameter' do
    @product.name = nil
    @product.save
    expect(Product.find(@product.id).name).not_to be_nil
  end

  it 'can be deleted' do
    @product.destroy
    expect(Product.where(id: @product.id).count).to eq(0)
  end
end
