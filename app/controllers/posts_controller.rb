class PostsController < ApplicationController
  include AutoHtml

  before_filter :check_user, :only => [:edit, :update, :destroy]
  respond_to :html, :js

  def check_user
   @post = Post.find(params[:id])
   #raise @post.to_yaml
   if current_user.id != @post.user_id
     if !current_user.is_admin
       flash[:alert] = "#{t 'post.unautherized_edit'}"
       redirect_to post_path
     end
   end
  end

  def index
   redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @title = @post.title
    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
    end
    if @post.is_inappropriate then
      flash[:alert] = "This post has been removed for having inappropriate content"
      redirect_to :root
    end
    # commented out cuz of multiple respond_to or redirect_to
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @post }
    #end
  end

  def new
    if current_user.nil?
      redirect_to(:root)
    elsif current_user.is_banned
      flash[:alert] = "#{t 'user.banned'}"
      redirect_to(:back)
    end
    @title = t 'header.new_post'
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    if (params[:locale] == "ar")
      @title = "#{t 'general.edit'}: #{@post.title}"
    else
      @title = "#{t 'general.edit'}ing: #{@post.title}"
    end
  end

  def create
    @title = t 'header.new_post'
    @post = Post.new(params[:post])
    post_formated = auto_html(@post.content) { simple_format; link(:target => 'blank') }
    @post.title = @post.content.split("\r\n")[0] if @post.content.present? && !@post.title.present?
    @post.content = post_formated
    #@post.content = @post.content.to_s.gsub("\r\n", '<br>')
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        current_user.vote_for(@post)
        @post.vote_count = @post.plusminus
        format.html { redirect_to @post, alert: "#{t 'post.create'}" }
        format.mobile { redirect_to @post, alert: "#{t 'post.create'}" }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.mobile { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id then
      respond_to do |format|
        if @post.update_attributes(params[:post])
          @post.content = @post.content.to_s.gsub("\r\n", '<br>')
          @post.update_attributes(:content => @post.content)
          format.html { redirect_to @post, alert: "#{t 'post.update'}" }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
      format.json { head :no_content }
    end
  end
  
  def vote
    @post = Post.find(params[:post_id])
    current_user.vote_for(@post) if !current_user.blank?
    @post.vote_count = @post.plusminus
    respond_to do |format|
      format.js
    end
  end
  
  def mark_inappropriate
    if user_signed_in?
      @post = Post.find(params[:post_id])
      @post.is_inappropriate = true
      @post.save!
      flash[:alert] = "#{t 'post.report_notice'}"
      redirect_to root_url
    else
      flash[:alert] = "#{t 'post.login_report'}"
      redirect_to :back
    end
  end
  
end
