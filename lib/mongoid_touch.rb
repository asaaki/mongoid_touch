# encoding: utf-8
require "mongoid"
require "mongoid/errors/document_not_updated"
require "mongoid/errors/frozen_instance"
require "mongoid/errors/missing_field"
require "mongoid/document/touch"

I18n.load_path << File.join(File.dirname(__FILE__), "config", "locales", "en.yml")

