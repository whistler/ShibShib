class UsersController < ApplicationController
  before_filter :check_user, :only => [:edit, :update, :destroy]

  def check_user
    @user = User.find(params[:id])#Rails takes "id" as "name" because of friendly_id gem
    if current_user.oauth_uid != @user.oauth_uid 
      flash[:alert] = "#{t 'user.unautherized_edit'}"
      redirect_to user_path
    elsif current_user.oauth_provider == "ShibShib"
      current_user.update_attribute(:oauth_uid, current_user.id)
    end
    current_user.update_attribute(:is_admin, true) if current_user.id == 1
  end

  def index
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(:user_id => @user.id, :is_inappropriate => false).page(params[:page]).order('created_at DESC').per_page(10)
    if (params[:locale] == "ar")
      @title = "#{@user.name} #{t 'header.profile'}"
    else
      @title = "#{@user.name}'s #{t 'header.profile'}"
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
    if (params[:locale] == "ar")
      @title = "#{t 'header.settings'}"
    else
      @title = "#{t 'header.settings'}"
    end
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, alert: "#{t 'user.unautherized_edit'}" }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, alert: "#{t 'user.update'}" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
end
