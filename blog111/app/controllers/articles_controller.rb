class ArticlesController < ApplicationController

  def index
    
    @articles = Article.page(params[:page]).per(20)
   
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new
  end
 
  def edit
    @article = Article.find(params[:id])
  end
 
  def create
    @article = Article.new(article_params)
    @article.posted_by = current_user.id
    if @article.save
      redirect_to @article
      
    else
      render 'new'
    end
  end
 
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
 
  def destroy
    @article = Article.find(params[:id])

    @article.destroy
 
    redirect_to articles_path
  end
 



   private
  def authenticate
    
    
  end

    

end