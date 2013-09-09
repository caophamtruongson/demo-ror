ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'mulodo.com',
  user_name:            'vu.son@mulodo.com',
  password:             'HSonTUyen131989',
  authentication:       'plain',
  enable_starttls_auto: true  
}
  
ActionMailer::Base.default_url_options[:host] = "localhost:3000"