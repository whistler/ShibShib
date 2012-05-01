Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "254428867974812", "e6c5507c3f88d2341ef0c6103736e617", :display => 'popup'
  #provider :twitter, 'xcWyDa408Ghy78r17D0Og', '5qO0OFrcJDx5UeRnXfS41fFrZ3kHt6GVN836nQiTA', :display => 'popup'
end
