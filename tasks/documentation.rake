#-----------------------------------------------------------------------
# Documentation
#-----------------------------------------------------------------------

namespace :doc do

  # generating documentation locally
  Rake::RDocTask.new do |rdoc|
    rdoc.rdoc_dir   = Moron::SPEC.local_rdoc_dir
    rdoc.options    = Moron::SPEC.rdoc_options 
    rdoc.rdoc_files = Moron::SPEC.rdoc_files
  end

  desc "Deploy the RDoc documentation to #{Moron::SPEC.remote_rdoc_location}"
  task :deploy => :rerdoc do
    sh "rsync -zav --delete #{Moron::SPEC.local_rdoc_dir}/ #{Moron::SPEC.remote_rdoc_location}"
  end

  if HAVE_HEEL then
    desc "View the RDoc documentation locally"
    task :view => :rdoc do
      sh "heel --root  #{Moron::SPEC.local_rdoc_dir}"
    end
  end
end
