# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
CartTemplate::Application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :address => "smtp.hostfabrica.ru",
   :port => 25,
   :domain => "originalpeptides.com.ua",
   :authentication => "cram_md5",
   :user_name => "noreply@originalpeptides.com.ua",
   :password => "go_35-mail"
}

