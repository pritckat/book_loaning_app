Rails.application.config.middleware.use OmniAuth::Builder do 
    provider :github, '8c62a79b86e50d97e1e9', 'd7be4008d3258559ade557395ead235939a8c064'
end