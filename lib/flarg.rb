require 'active_support'
require 'flarg/version'

module Flarg

  extend ActiveSupport::Concern

  NAMESPACE = "#{name.downcase}_"

  module ClassMethods

    def configure(&block)
      config.tap &block
    end

  end


  def [](key)
    Rails.application.config.send(convert_key(key))
  rescue NoMethodError
    nil
  end
  alias_method :retrieve, :[]


  def []=(key,value)
    Rails.application.config.send("#{convert_key(key)}=",value)
  end
  alias_method :store, :[]=

private

  def convert_key(key)
    NAMESPACE + (key.kind_of?(Symbol) ? key.to_s : key)
  end


  def method_missing(name,*args)
    if name.to_s =~ /=$/
      store(name.to_s.sub(/=$/,""),args.first)
    else
      retrieve(name)
    end
  end

end

require 'flarg/railtie' if defined?(Rails)
