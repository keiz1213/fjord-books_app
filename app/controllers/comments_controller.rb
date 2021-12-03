# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, :set_commentable_type, only: %i[edit update destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.save!
    redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  def edit; end

  def update
    @comment.update!(comment_params)
    redirect_to @commentable_type, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
  end

  def destroy
    @comment.destroy
    redirect_to @commentable_type, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_commentable_type
    @commentable_type = @comment.commentable_type.constantize.find_by(id: @comment.commentable_id)
  end

  def comment_params
    parameter = params.require(:comment).permit(:content)
    parameter.merge(user: current_user)
  end
end
