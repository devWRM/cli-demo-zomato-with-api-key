# require gems
require 'bundler/setup' # make sure all gems in the Gemfile are present on this machine
require 'dotenv/load' # I'm only putting this here because the docs say "as early as possible"
Bundler.require # require at runtime

# require_relative your code
require_relative "../lib/version"
require_relative "../lib/api"
require_relative "../lib/cli"
require_relative "../lib/restaurant"
