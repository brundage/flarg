require 'rails/railtie'
require 'singleton'

module Flarg
  class Railtie < Rails::Railtie

    config.before_configuration do |config|
      n = "#{Rails.application.class.to_s.split("::").first}Config"
      eval %Q( class ::#{n}
                 include Singleton
                 include Flarg
                 class << self
                   alias_method :config, :instance
                 end
               end
             )
    end
  end
end
