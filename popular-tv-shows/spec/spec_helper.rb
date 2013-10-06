require_relative '../lib/tv_show'
require_relative '../lib/pirate_bay'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  # config.formatter = :progress # :progress, :html, :textmate
end