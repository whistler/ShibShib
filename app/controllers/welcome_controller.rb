class WelcomeController < ApplicationController
  # before_filter :authenticate_user!, :except=>"index"
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 6)
	
	  respond_to do |format|
		format.html
		format.js {
			render :update do |page|
			page.insert_html :bottom, 'results', :partial => 'posts_list'
			end
		}
	  end
  end
end
