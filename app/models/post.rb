# frozen_string_literal: true

class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, :comments



  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end


  # def comment_content=(content)
  #   new_comment = Comment.find_or_create_by(:content)
  #   self.comments << new_comment
  # end

  # def comment_content
  #   comments.each do |content|
  #     content
  #   end
  # end


end
