class Post < ActiveRecord::Base
  after_save :update_vote_count
  scope :reported, where(:is_inappropriate => true)

  acts_as_voteable
  belongs_to :user
  
  has_attached_file :image,
  :styles => { :large => "720>", :medium => "560>", :thumb => "100x100>" },
  :storage => :s3,
  :bucket => 'ShibShibBlastic',
  :s3_credentials => {
    :access_key_id => "AKIAIISMCRUVUPIWIV2A",
    :secret_access_key => "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"
  }
  
  def self.feed(last)
    self.where("created_at < ? ", last).order('created_at desc').limit(5)
  end
  
  validates_presence_of :title
  validates_presence_of :content, :if => :image_exists
  validates_attachment_presence :image, :if => :content_exists
  validates_attachment_size :image, :less_than=>2.megabyte, :if => Proc.new { |imports| !imports.image_file_name.blank? }
  
  def update_vote_count
    self.vote_count = self.plusminus
  end

  def image_exists
    image.to_s.include? "missing" #true
  end

  def content_exists
    content.gsub(/\s+/, "").tr("\n","").empty?
  end

end
