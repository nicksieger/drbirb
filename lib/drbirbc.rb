#!/usr/bin/env ruby

require 'irb'
require 'drb'

module IRB
  def IRB.start_remote drb_uri
    DRb.start_service
    remote_service = DRbObject.new nil, drb_uri
    input_proc = proc do |prompt|
      l = Readline.readline prompt
      Readline::HISTORY.push(l) if l and !l.empty?
      l
    end
    output_proc = proc do |l|
      print l
    end
    remote_service.irb_start input_proc, output_proc
  end

  def IRB.remote_url
    uri = ARGV[0] || ENV['IRB_URL']
    unless uri =~ /^dr(uby|b[a-z0-9]+):/
      uri = "druby://127.0.0.1:7777"
    end
    uri
  end
end

IRB.start_remote IRB.remote_url
