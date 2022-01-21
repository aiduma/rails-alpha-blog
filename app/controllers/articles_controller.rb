class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, except: [:show, :index]
   
    def show
    end
  
    def index
      ## perform a paginated query:
      @articles = Article.paginate(page: params[:page], per_page: 5)
    end
  
    def new
      @article = Article.new
    end
  
    def edit
    end
  
    def create
      @article = Article.new(article_params)

      @article.user = current_user
      if @article.save
        flash[:notice] = "Article was created successfully."
        redirect_to @article
      else
            render :new, status: :unprocessable_entity
      end
    end    

    def update
      if @article.update(article_params)
        flash[:notice] = "Article was updated successfully."
        redirect_to @article
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def destroy
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_path }
        format.json { head :no_content }
      end
    end
  
    private
  
    def set_article
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :description)
    end

    def require_same_user
      if @article && current_user !=@article.user
        flash[:alert] = "You can only edit or delete your own article"
        redirect_to @article
      end
    end
end