require 'rails/railtie'
module Flarg
  class Railtie < Rails::Railtie

    initializer 'flarg.setup_config_class' do |app|
      n = "#{app.class.to_s.split("::").first}Config"
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
