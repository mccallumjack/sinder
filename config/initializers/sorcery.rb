# The first thing you need to configure is which modules you need in your app.
# The default is nothing which will include only core features (password encryption, login/logout).
# Available submodules are: :user_activation, :http_basic_auth, :remember_me,
# :reset_password, :session_timeout, :brute_force_protection, :activity_logging, :external
SORCERY_GITHUB_CONFIG = YAML.load_file("#{::Rails.root}/config/application.yml")[::Rails.env]

Rails.application.config.sorcery.submodules = [:external]

# Here you can configure each submodule's features.
Rails.application.config.sorcery.configure do |config|
   config.external_providers = [:github]

   config.github.key = "#{Rails.application.secrets.sorcery_github_key}"
   config.github.secret = "#{Rails.application.secrets.sorcery_github_secret}"
   config.github.callback_url = "#{Rails.application.secrets.sorcery_github_callback_url}"
   config.github.user_info_mapping = {:email => "name"}


  # --- user config ---
  config.user_config do |user|

    user.authentications_class = Authentication


  end

  # This line must come after the 'user config' block.
  # Define which model authenticates with sorcery.
  config.user_class = "User"
end
