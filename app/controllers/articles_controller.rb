# frozen_string_literal: true
class ArticlesController < ApplicationController
  helper_method :articles, :article

  def index; end

  def show; end

  def new;  end

  def edit; end

  def create
    if article.save
      redirect_to article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if article.update(article_params)
      redirect_to article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def article
    @article ||= if params[:id]
                   Article.find(params[:id])
                 elsif params[:article]
                   Article.new(article_params)
                 else
                   Article.new
                 end
  end

  def articles
    @articles ||= Article.all
  end

  def article_params
    params.require(:article).permit(:name, :description, tags_attributes: [:name])
  end
end
