class ArticlesController < ApplicationController
    def show
        # inorder to available article variable to show.html.erb, turn article into instance var as @article
        # debugger is a debugger where we can debug and see...uncomment below
        # debugger
        @article = Article.find(params[:id])
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
        @article = Article.new(params.require(:article).permit(:title, :description))

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
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:id, :title, :description))
            flash[:notice] = "Article was updated successfully."
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

end