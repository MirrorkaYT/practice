class ArticlesController < ApplicationController
	def index
		@articles= Article.all
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


	def create
			@article = current_user.articles.new(article_params)

			if @article.save
			    redirect_to user_article_path(current_user.id, @article)
			  else
			    render 'new'
			  end
	end
	def edit
		@article = Article.find(params[:id])

	end
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to 
		else
			render 'edit'
		end

	end
	def destroy
		@article = Article.find(params[:id])
  		@article.destroy
 		
  		redirect_to user_articles_path
  		
	end
	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

end