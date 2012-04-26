Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "254428867974812", "e6c5507c3f88d2341ef0c6103736e617", :display => 'popup'
  provider :twitter, "eWjPI8AouBG2gsj94j2UNg", "vegxmi6w52olZ2188GRhWUYu7CoyNLHQ3KsRszh5A8", :display => 'popup'
end
