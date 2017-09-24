ActionMailer::Base.smtp_settings = {
  address: ENV.fetch('SMTP_ADDRESS'),
  port: ENV.fetch('SMTP_PORT', 587),
  domain: ENV.fetch('SMTP_DOMAIN'),
  user_name: ENV.fetch('SMTP_USER'),
  password: ENV.fetch('SMTP_PASSWORD'),
  authentication: :plain,
  enable_starttls_auto: false
}
