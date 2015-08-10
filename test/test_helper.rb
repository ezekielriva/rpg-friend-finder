ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/mock"

class ActiveSupport::TestCase
end

class ActionController::TestCase
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods
end

class Minitest::Test
  def location
    loc        = " [#{self.failure.location}]" unless passed? or error?
    test_class = self.class.to_s.gsub("::", " / ").gsub("Test", "")
    test_name  = self.name.to_s.gsub("test_", "").gsub("_", " ")
    "#{test_class} / #{test_name}#{loc}"
  end
end
