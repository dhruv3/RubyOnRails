class CommentsController < ApplicationController

  def create
    @comment = Comment.new
    @comment.author_name = params[:comment][:author_name]
    @comment.body = params[:comment][:body]
    @comment.article_id = params[:article_id]

    @comment.save

    redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
