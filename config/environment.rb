# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
CartTemplate::Application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => CONFIG[:email_host_address],
    :port => 25,
    :domain => CONFIG[:email_domain],
    :authentication => "cram_md5",
    :user_name => CONFIG[:email_username],
    :password => CONFIG[:email_password]
}
