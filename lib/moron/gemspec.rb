require 'rubygems'
require 'moron/specification'
require 'moron/version'
require 'rake'

# The Gem Specification plus some extras for moron.
module Moron
  SPEC = Moron::Specification.new do |spec|
    spec.name               = "moron"
    spec.version            = Moron::VERSION
    spec.rubyforge_project  = "moron"
    spec.author             = "LeMarsu"
    spec.email              = "ch.ruelle@lemarsu.com"
    spec.homepage           = "http://moron.rubyforge.org/"

    spec.summary            = "A Summary of moron."
    spec.description        = <<-DESC
		A longer more detailed description of moron.
		DESC

    spec.extra_rdoc_files   = FileList["[A-Z]*"]
    spec.has_rdoc           = true
    spec.rdoc_main          = "README"
    spec.rdoc_options       = [ "--line-numbers" , "--inline-source" ]

    spec.test_files         = FileList["spec/**/*.rb", "test/**/*.rb"]
    spec.files              = spec.test_files + spec.extra_rdoc_files + 
      FileList["lib/**/*.rb", "resources/**/*"]

    spec.executables        = [spec.name, "#{spec.name}-init", "#{spec.name}-hook"]


    # add dependencies
    # spec.add_dependency("somegem", ">= 0.4.2")

    spec.platform           = Gem::Platform::RUBY

    spec.local_rdoc_dir     = "doc/rdoc"
    spec.remote_rdoc_dir    = "#{spec.name}/rdoc"
    spec.local_coverage_dir = "doc/coverage"
    spec.remote_coverage_dir= "#{spec.name}/coverage"

    spec.remote_site_dir    = "#{spec.name}/"

  end
end


