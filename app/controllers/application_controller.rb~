class ApplicationController < ActionController::Base

  protect_from_forgery
  before_filter :set_user_language
  
  private
  
  def set_user_language
	I18n.locale = 'ar' #current_user.language if logged_in?
  end
  
end
