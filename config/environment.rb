# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ShibShibBlastic::Application.initialize!

#fix rails-i18n translation missing errors in production
I18n.load_path = Dir.glob("#{RAILS_ROOT}/locales/**/*.{rb,yml}")
I18n.default_locale = 'en'
I18n.reload!

