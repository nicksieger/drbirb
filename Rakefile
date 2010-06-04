# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'hoe/gemcutter'
require './lib/drbirb/version.rb'

Hoe.plugin :gemcutter

hoe = Hoe.spec('drbirb') do |p|
  p.rubyforge_name = "caldersphere"
  p.version = Drbirb::VERSION
  p.developer('Nick Sieger', 'nick@nicksieger.com')
end
hoe.spec.rdoc_options += ["-SHN", "-f", "darkfish"]
