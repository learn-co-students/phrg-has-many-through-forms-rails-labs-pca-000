# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.comments.create(comment_params)
    # binding.pry
    redirect_to post
  end

private

  def comment_params
    params
      .require(:comment)
      .permit(
        :content,
        :post_id,
        :user_id,
        user_attributes: [:username]
      )
  end
end
