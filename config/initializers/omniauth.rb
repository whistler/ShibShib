Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "254428867974812", "e6c5507c3f88d2341ef0c6103736e617", :display => 'popup'
  provider :twitter, "nVIq2e2sub1WkFKwIG0A", "kHs0RfBeGuY7Zmtr1NdBeqY1zBA5YqsLhCc8p5RO48", :display => 'popup'
end
