require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StudySite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.after_initialize do
      guest_user = User.find_or_create_by(email: User::GUEST_USER_EMAIL)
      
      guest_user.posts.each { |post| post.destroy } if guest_user.posts.any?
      guest_user.post_comments.each { |comment| comment.destroy } if guest_user.post_comments.any?
    end
  end
end
