require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Meeho
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:            'smpt.gmail.com',
      port:               587,
      domain:             'gmail.com',
      user_name:          'no.reply.meeho',
      password:           'RubySchool2019!',
      authentication:     'plain',
      anable_starttls_auto: true
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.i18n.default_locale = :'es-MX'

  end
end
