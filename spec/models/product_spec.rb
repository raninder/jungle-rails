require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  
    it "name should be present" do 
      @cat = Category.create(name:'Shoes')
      @product = Product.create(category:@cat,description: "aabbb",image: 'aaa',quantity: 1,price: 64.99)
      # expect(@product.errors.full_messages.size).to eq(1)
      expect(@product.errors.full_messages.size).to be_positive
    end

    it "price should be present" do 
      @cat = Category.create(name:'Shoes')
      @product = Product.create(category:@cat,name: "Adidas",description: "aabbb",image: 'aaa',quantity: 1)
      expect(@product.errors.full_messages.size).to be_positive
    end

    it "quantity should be present" do 
      @cat = Category.create(name:'Shoes')
      @product = Product.create(category:@cat,name: "Adidas",description: "aabbb",image: 'aaa',price: 10)
      expect(@product.errors.full_messages.size).to be_positive
    end

    it "category should be present" do 
      @cat = Category.create(name:'Shoes')
      @product = Product.create(name: "Adidas",description: "aabbb",image: 'aaa',price: 10,quantity: 1)
      puts @product.errors.full_messages
      expect(@product.errors.full_messages.size).to be_positive
    end
  end
end