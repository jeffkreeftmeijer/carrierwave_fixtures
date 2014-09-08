ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class CarrierWave::Mount::Mounter
  def store!
    # Not storing uploads in the tests
  end
end

class ActiveSupport::TestCase
  include ActionDispatch::TestProcess

  fixtures :all

  CarrierWave.root = Rails.root.join('test/fixtures/files')

  def after_teardown
    CarrierWave.clean_cached_files!(0)
  end
end
