class ArticlesController < ApplicationController
    
    def index
    	@articles=Article.all
    end

	def new

	  @article=Article.new

	end

	def edit
        @article =Article.find(params[:id])


	end

	def create
	   #render plain: params[:article].inspect
	  @article=Article.new(article_params)
	

		   if @article.save

		   	flash[:notice]="Article added succesfully"
		   	redirect_to article_path(@article)

		   else
		   	  render 'new'
		   end

	end

	def update
       @article =Article.find(params[:id])
       
		   if @article.update(article_params)

		   	flash[:notice]="Article Update succesfully"
		   	redirect_to article_path(@article)

		   else
		   	  render 'edit'
		   end

	end

	def destroy
        @article =Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article deleted successfully done!!"
        redirect_to articles_path
	end

	def show
    
     @article =Article.find(params[:id])

	end



	private
	def article_params
	   params.require(:article).permit(:title, :description)
	end

end