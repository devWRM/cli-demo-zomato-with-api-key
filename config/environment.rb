# require gems
require 'bundler/setup' # make sure all gems in the Gemfile are present on this machine
Bundler.require # require at runtime
# require_relative your code
require_relative "../lib/api"
require_relative "../lib/cli"
# require_relative "../lib/restaurant"
