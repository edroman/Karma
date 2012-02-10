Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, AppConfig['twitter_token'], AppConfig['twitter_secret']
  provider :linkedin, AppConfig['linkedin_token'], AppConfig['linkedin_secret']
  provider :facebook, AppConfig['facebook_token'], AppConfig['facebook_secret'], {client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}

#  provider :facebook, '292130894158710', '8f66bc67685466fc043a751404c4b692', {:client_options => {:ssl => {:verify => false}}}
#  provider :facebook, '292130894158710', '8f66bc67685466fc043a751404c4b692', {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
#  provider :facebook, '292130894158710', '8f66bc67685466fc043a751404c4b692', {:ssl => {:ca_file => '/etc/pki/tls/certs/ca-bundle.crt'}}}
end