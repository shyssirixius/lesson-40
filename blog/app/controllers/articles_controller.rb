class ArticlesController < ApplicationController

def index
 @articles = Article.all 

end

def show 
  @article = Article.find(params[:id])
end




def edit 
  @article = Article.find(params[:id])
end

def update 
  @article = Article.find(params[:id])

    if @article.update(article_params)
     
      redirect_to @article
    else
      render action: 'edit'
    end

end




def new

end

def create

    @article = Article.new(article_params)
    if 
      @article.save
      redirect_to @article
    else
      render action: 'show'
    end
end


def destroy
  @article = Article.delete(params[:id])
  if 
      @article.save
      redirect_to @article
    else
      render action: 'new'
    end

end


private

def article_params
    params.require(:article).permit(:title,:text)
end


end