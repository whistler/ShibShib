class WelcomeController < ApplicationController
  # before_filter :authenticate_user!, :except=>"index"
  def index
    @posts = Post.page(params[:page]).per_page(10)
  end
end
