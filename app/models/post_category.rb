# frozen_string_literal: true

class PostCategory < ActiveRecord::Base
  belongs_to :post
  belongs_to :category
end
