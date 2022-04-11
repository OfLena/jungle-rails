require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create!(name: "test-category")
      
      @product = Product.create!(name: "test name", price_cents: 1000, quantity: 1, category_id: @category[:id])
      @product.save
    end
      it "is valid with valid attributes" do
      expect(@product).to be_valid
    
    end
      it "is not valid without a name" do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages.include?("Name can't be blank"))

  end
    it "is not valid without a price" do
    @product.price_cents = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages.include?("price_cents can't be blank"))

  end
    it "is not valid without a quantity" do
    @product.quantity = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages.include?("Quantity can't be blank"))
    
  end
    it "is not valid without a category" do
    @product.category_id = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages.include?("Category can't be blank"))
    
  end
  end
end
