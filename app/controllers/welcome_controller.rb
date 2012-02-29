class WelcomeController < ApplicationController
  # before_filter :authenticate_user!, :except=>"index"
  def index
    @posts = Post.all
  end
end
