class ArticlesController < ApplicationController

    def show
        # inorder to available article variable to show.html.erb, turn article into instance var as @article
        # debugger is a debugger where we can debug and see...uncomment below
        # debugger
        @article = Article.find(params[:id])
        # params/parameters recives data as hash from the url https://alpha-blog/article/1
        # params has controller and action by default for redirecting to the respective files and actions
    end
end