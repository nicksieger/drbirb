# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{drbirb}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Sieger"]
  s.date = %q{2010-01-12}
  s.description = %q{Small script/plugin to run a DRb/IRB server inside of your
(Rails/Merb/whatever) application, so you can poke around in it while
it's running.

Original code from Charles Lowe [ruby-talk:250220], I just wrapped
up into a nice package, because I think this is a cool development and
debugging tool.

[ruby-talk:250220]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/250220}
  s.email = ["nick@nicksieger.com"]
  s.executables = ["drbirb", "drbirbc"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/drbirb", "bin/drbirbc", "init.rb", "lib/drbirb/loader.rb", "lib/drbirb/server.rb", "lib/drbirb/version.rb", "lib/drbirbc.rb", "tasks/drbirb.rake", "test/test_drbirb.rb"]
  s.homepage = %q{http://caldersphere.rubyforge.org/drbirb}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{drbirb}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Small script/plugin to run a DRb/IRB server inside of your (Rails/Merb/whatever) application, so you can poke around in it while it's running}
  s.test_files = ["test/test_drbirb.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.3.2"])
    else
      s.add_dependency(%q<hoe>, [">= 2.3.2"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.3.2"])
  end
end
