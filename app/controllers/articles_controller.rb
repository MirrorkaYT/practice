class ArticlesController < ApplicationController
  helper_method :sort_column, :sort_direction
      before_action :all_tasks


  def index
    @artCompl=Article.where(completed: true).order("priority" + ' ' + "asc")
    @artIncompl=Article.where(completed: false).order(sort_column + ' ' + sort_direction)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    unless current_user
      redirect_to home_url, notice: 'you are not logged in. Log in, please'
    end

    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
      @article = current_user.articles.new(article_params)
      n=1
      loop do
        unless Article.find_by priority: n
          @article.priority=n
          break
        end
        n+=1
      end

    respond_to do |format|
      if @article.save
        format.html { redirect_to user_article_path(current_user.id, @article), notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: user_article_path(current_user.id, @article) }
        format.js {  }
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
        @artCompl=Article.where(completed: true)
        @artIncompl=Article.where(completed: false)
        format.html { redirect_to user_articles_path(current_user.id), notice: 'Post was successfully updated.' }
        format.json { render json: @article }

      else

        format.js{}
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
      @articles=Article.all
      @artCompl=Article.where(completed: true)
    @artIncompl=Article.where(completed: false)
    end




    def sort_column
      params[:sort] || "priority"
    end
    def sort_direction
      params[:direction] || "asc"
    end
    def article_params
      params.require(:article).permit(:title, :text, :priority, :date, :completed)
    end

end
