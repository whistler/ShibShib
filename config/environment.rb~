# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ShibShibBlastic::Application.initialize!


config.before_configuration do
      I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
      I18n.locale = 'en'
      I18n.reload!
    end

