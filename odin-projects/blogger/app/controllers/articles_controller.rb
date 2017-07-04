class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    #for displaying comments
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    #fail: helps to see what params we have received
    #@article = Article.new(article_params): this is a way to use helper methods
    @article = Article.new
    @article.title = params[:article][:title]
    @article.body = params[:article][:body]
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"
    #we don't need to show a new page, so e redirect it to
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    flash.notice = "Article '#{@article.title}' Deleted!"
    @article.destroy
    redirect_to action: 'index'
  end
end
