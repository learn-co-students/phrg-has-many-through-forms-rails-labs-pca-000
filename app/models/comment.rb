# frozen_string_literal: true

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :all_blank

  def user_attributes=(user_attributes)
    user_attributes.values.each do |attr|
      self.user = User.find_or_create_by(username: attr) unless attr.blank?
    end
  end
end
