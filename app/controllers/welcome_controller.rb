class WelcomeController < ApplicationController
  # before_filter :authenticate_user!, :except=>"index"
  def index
    @posts = Post.page(params[:page]).order('vote_count DESC').per_page(10)
  end
  
  def latest
    @posts = Post.page(params[:page]).order('created_at DESC').per_page(10)
  end
  
end
