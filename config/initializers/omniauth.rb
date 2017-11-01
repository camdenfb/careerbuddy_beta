OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '447844502173-sjp4car1tlh86jnmissesbtvgnm56v8s.apps.googleusercontent.com', 'lwp7HNSZVBolKEtkI7Hs0Icn', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end