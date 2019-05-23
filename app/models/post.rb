# frozen_string_literal: true

class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, :comments

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attributes|
      next unless category_attributes[:name].present?
      category = Category.find_or_create_by(name: category_attributes[:name])
      unless categories.include?(category)
        post_categories.build(category: category)
      end
    end
  end
end
