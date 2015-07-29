class ArticlesController < ApplicationController
  helper_method :sort_column, :sort_direction
      before_action :all_tasks, only: [:create, :update, :destroy]

    respond_to :html, :js

  def index

    @articles = Article.order(sort_column + " " + sort_direction)


  end
  def show
      @article = Article.find(params[:id])

  end

  def new
    if !current_user
      redirect_to home_url, notice: 'you are not logged in. Log in, please'
    end

    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
      @article = current_user.articles.new(article_params)

      @article.priority = 1
    respond_to do |format|
      if @article.save
        format.html { redirect_to user_article_path(current_user.id, @article), notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: user_article_path(current_user.id, @article) }
        format.js {}
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end
  
  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to user_article_path(current_user.id, @article), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end

  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
  end

  
  private
    def all_tasks
      @articles = Article.all
    end




    def sort_column
      params[:sort] || "id"
    end
    def sort_direction
      params[:direction] || "asc"
    end
    def article_params
      params.require(:article).permit(:title, :text, :priority, :date)
    end

end
