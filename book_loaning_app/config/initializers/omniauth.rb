Rails.application.config.middleware.use OmniAuth::Builder do 
    provider :github, ENV['secret_thing'], ENV['other_secret']
end