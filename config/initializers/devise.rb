Devise.setup do |config|
  # The e-mail address that mail will appear to be sent from
  # If absent, mail is sent from "please-change-me-at-config-initializers-devise@example.com"
  config.mailer_sender = ENV['DEFAULT_EMAIL_SENDER'] || "please-set_default_email_in_env@example.com"
  config.password_length = 6..124
  # If using rails-api, you may want to tell devise to not use ActionDispatch::Flash
  # middleware b/c rails-api does not include it.
  # See: http://stackoverflow.com/q/19600905/806956
  config.navigational_formats = [:json]
  # config.secret_key = '840ac1d8b868f9347e5c40c2f6d547b33641d7510214c659ad52ffc35a6de9bec9e691876433ac8e1559c96a5e63faa38965e15c055566fee56f0231886d9cf5'
  config.secret_key = ENV['RAKE_SECRET']

  # config.mailer = "DeviseBackgrounder"
end