class Admin::DashboardController < ApplicationController
  def show
    @num_categories = Category.count(:name)
    @num_products = Product.sum(:quantity)
  end
end
