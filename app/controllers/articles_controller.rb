class ArticlesController < ApplicationController

	def index
		@articles = Article.all
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


    respond_to do |format|
      if @article.save
        format.html { redirect_to user_article_path(current_user.id, @article), notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: user_article_path(current_user.id, @article) }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
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
 		
  		redirect_to user_articles_path
  		
	end
	def sort_author
		@articles = Article.all.order(:id)
		 respond_to do |format|
		 	format.html { redirect_to user_articles_path(current_user.id) }
			format.js {}
		end
	end
	def sort_text
		@articles = Article.all.order(:text)
	end
	def sort_title
		@articles = Article.all.order(:title)
	end
	private

		def article_params
			params.require(:article).permit(:title, :text)
		end

end
