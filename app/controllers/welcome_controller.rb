class WelcomeController < ApplicationController
  # before_filter :authenticate_user!, :except=>"index"
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
  end
end
