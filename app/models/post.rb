class Post < ActiveRecord::Base
  acts_as_voteable
  belongs_to :user
  has_many :ratings
  has_attached_file :image,
  :styles => { :large => "800>", :medium => "600>", :thumb => "100x100>" },
  :storage => :s3,
  :bucket => 'ShibShibBlastic',
  :s3_credentials => {
    :access_key_id => "AKIAIISMCRUVUPIWIV2A",
    :secret_access_key => "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"
  }
end
