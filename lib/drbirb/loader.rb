require 'drbirb/version'
require 'drbirb/server'

module Drbirb
  @server = DRb.start_service 'druby://127.0.0.1:7777', IRB::RemoteService.new
  $stderr.puts "Drbirb version #{Drbirb::VERSION}"
  $stderr.puts "* IRB::RemoteService available at #{DRb.uri.inspect}"
  def self.server
    @server
  end
end
