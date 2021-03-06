= drbirb

* http://caldersphere.rubyforge.org/drbirb

== DESCRIPTION:

Small script/plugin to run a DRb/IRB server inside of your Ruby
application, so you can poke around while it's running.

Original code from Charles Lowe [ruby-talk:250220], I just wrapped
up into a nice package, because I think this is a cool development and
debugging tool.

[ruby-talk:250220]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/250220

== REQUIREMENTS:

* DRb, IRB (i.e., nothing above the standard library)

== SYNOPSIS:

Start the server on localhost:7777:

  require 'drbirb/loader'

  # join the thread unless you have some other code that prevents the
  # interpreter from exiting
  Drbirb.server.thread.join

Start the server on a custom host/port:

  require 'drbirb/server'
  irb_host, irb_port = ...
  server = DRb.start_service "druby://#{irb_host}:#{irb_port}", IRB::RemoteService.new

  # join the thread unless you have some other code that prevents the
  # interpreter from exiting
  server.thread.join

Start the client:

  drbirbc
  drbirbc druby://localhost:7777

When intalled as a Rails plugin, the server is started automatically
for you in the plugin's init.rb.

== INSTALL:

  gem install drbirb

To use in a Rails app (legacy/plugin):

  script/plugin install http://github.com/nicksieger/drbirb.git

== LICENSE:

(The MIT License)

Copyright (c) 2008-2012 Nick Sieger

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
