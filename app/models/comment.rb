# frozen_string_literal: true

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :all_blank

  def user_attributes=(attribute)
    return if attribute[:username].empty?
    user = User.find_or_create_by(attribute)
    self.user = user
  end
end
