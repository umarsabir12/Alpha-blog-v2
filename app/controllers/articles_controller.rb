class ArticlesController < ApplicationController

  def show
   
    @article = Article.find(params[:id]) 
  end
  
  def index
  @article = Article.all
  @user = User.all
  end
  
  def new
    @article = Article.new
  end 
  
  def edit
  @article = Article.find(params[:id])
  end


  def create

   @article = Article.new(params.require(:article).permit(:title, :description))
   if @article.save
     flash[:notice] = "Article was created successfully."
     redirect_to @article 
   else
     render 'new'
   end 
  end

  def update
   @article =  Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Articall was created sucessfully"
      redirect_to @article
    else
      render 'edit'
     end
    end

    def destroy
      Article.delete(params[:id])
      if @article.destroy
        flash[:notice] = "Article deleted succesfully "
      else
      redirect_to '/articles'
      end
    end
end
