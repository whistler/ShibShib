# RailsAdmin config file. Generated on April 28, 2012 21:51
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['ShibShib', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  config.excluded_models = [Vote]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [AdminUser, Post, User, Vote]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))
  
  config.model Post do
    # Found associations:
      configure :user, :belongs_to_association 
      configure :slugs, :has_many_association         # Hidden 
      configure :votes, :has_many_association   #   # Found columns:
      configure :user_id, :integer         # Hidden 
      configure :title, :string 
      # configure :image_url, :string 
      # configure :image_file_name, :string         # Hidden 
      # configure :image_content_type, :string         # Hidden 
      # configure :image_file_size, :integer         # Hidden 
      # configure :image_updated_at, :timestamp         # Hidden 
      configure :image, :paperclip 
      configure :slug, :string 
      configure :vote_count, :integer 
      configure :is_inappropriate, :boolean   #   # Sections:
    list do; end
    export do; end
    show do; end
    edit do; end
    create do; end
    update do; end
  end
  
  config.model User do
    # Found associations:
      configure :votes, :has_many_association 
      configure :posts, :has_many_association   #   # Found columns:
      configure :name, :string 
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      configure :email, :string 
      # configure :password, :password         # Hidden 
      # configure :password_confirmation, :password         # Hidden 
      # configure :reset_password_token, :string         # Hidden 
      # configure :reset_password_sent_at, :datetime 
      # configure :remember_created_at, :datetime 
      configure :sign_in_count, :integer 
      # configure :current_sign_in_at, :datetime 
      # configure :last_sign_in_at, :datetime 
      # configure :current_sign_in_ip, :string 
      # configure :last_sign_in_ip, :string 
      configure :is_banned, :boolean 
      configure :is_admin, :boolean 
      # configure :oauth_provider, :string 
      # configure :oauth_uid, :integer 
      # configure :facebook_oauth_id, :string 
      # configure :twitter_oauth_id, :string 
      # configure :facebook_oauth_uid, :string 
      # configure :twitter_oauth_uid, :string   #   # Sections:
    list do; end
    export do; end
    show do; end
    edit do; end
    create do; end
    update do; end
  end
  # config.model Vote do
  #   # Found associations:
  #     configure :voteable, :polymorphic_association 
  #     configure :voter, :polymorphic_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :vote, :boolean 
  #     configure :voteable_id, :integer         # Hidden 
  #     configure :voteable_type, :string         # Hidden 
  #     configure :voter_id, :integer         # Hidden 
  #     configure :voter_type, :string         # Hidden 
  #     configure :created_at, :timestamp 
  #     configure :updated_at, :timestamp   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  
  if defined?(WillPaginate)
    module WillPaginate
      module ActiveRecord
        module RelationMethods
          alias_method :per, :per_page
          alias_method :num_pages, :total_pages
          alias_method :total_count, :count
        end
      end
    end
  end
end