# Flarg

Adds a class to your ralis app that stores configuration variables.

[![Build Status](https://secure.travis-ci.org/brundage/flarg.png)](http://travis-ci.org/brundage/flarg)
[![Dependency Status](https://gemnasium.com/brundage/flarg.png)](https://gemnasium.com/brundage/flarg)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/brundage/flarg)
[![Buggerall](https://buggerall.herokuapp.com/bug/flarg.png)](https://github.com/brundage/buggerall)

## WTF?

> Isn't there a `Rails.application.config`?

Yes, and this gem uses it so you can do:

    # config/initializers/some_initializer.rb
    
    MyKeenAppConfig.configure do |config|
    
      config.use_recursive_sql = Rails.application.config.database_configuration[Rails.env]["adapter"] == "postgresql"
    
    end

Then in your app somewhere:

    class Thing < ActiveRecord::Base
    
      def ancestors
        if MyKeenAppConfig.config.use_recursive_sql
          self.class.find_by_sql(%Q^ WITH RECURSIVE parents AS ( SELECT .... )^)
        else
          Rails.logger.debug("Recursive SQL not supported by this database")
        end
      end

Flarg namespaces keys in `Rails.application.config` so you don't have to!
