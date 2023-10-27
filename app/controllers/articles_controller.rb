class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
        # inorder to available article variable to show.html.erb, turn article into instance var as @article
        # debugger is a debugger where we can debug and see...uncomment below for enabling debug option
        # debugger
        # @article = Article.find(params[:id])
        # params/parameters recives data as hash from the url https://alpha-blog/article/1
        # params has controller and action by default for redirecting to the respective files and actions
    end

    # default method made available to routes
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        # to render/view on a browser
        # render plain: params[:article]

        # strong parameters - whitelisting the data
        @article = Article.new(article_params)

        # to give detail rendering
        # render plain: @article.inspect

        # to save in db
        if @article.save
            # to display the msg as pop-yup
            flash[:notice] = "Article was created successfully."
            # after usimg flash then go-to application.html.erb and use it there globally

            # to redirect to the saved article page 
            # redirect_to article_path(@article) i.e redirect_to Prefix_path
            # or
            redirect_to article_path(@article)
        else
            render 'new'
            # if we render new then create a var for the Article model class in new action
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    # whatever methods we put below private are private methods
    private
    def set_article
        @article = Article.find(params[:id])
    end
    def article_params
        params.require(:article).permit(:title, :description)
    end

end