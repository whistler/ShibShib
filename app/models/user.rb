class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name
  scope :banned, where(:is_banned => true)
  acts_as_voter
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :is_banned,
             #     :oauth_uid, :oauth_provider
  
  has_many :posts
  has_many :ratings
  
  validates_presence_of :name
  validates_uniqueness_of :name

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:oauth_uid => data.uid, :oauth_provider => "Facebook").first
      user
    else
      User.create!(:name => data.name, :oauth_uid => data.uid, :oauth_provider => "Facebook", :email => data.email, :password => Devise.friendly_token[0,20])
    end
  end


  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    #raise data.to_yaml
    if user = User.where(:oauth_uid => data.id, :oauth_provider => "Twitter").first()
      user
    else # Create a user with a stub password. 
      User.create!(:name => data.name, :oauth_uid => data.id, :oauth_provider => "Twitter", :email => "twitter_"+data.name+"@twitter.com", :password => Devise.friendly_token[0,20]) 
    end
  end
  
  def vote_for(voteable)
    super
    voteable.update_attributes!(:vote_count => voteable.plusminus)
  end
end
