desc 'Build the docker image'
task :build do
  sh 'docker build -t ruby-pkg .'
end

desc 'Build and package a ruby version'
task :package do
  sh %Q{docker rm ruby-pkg-#{ENV.fetch('RUBY_VERSION')}}
  sh %Q{docker run --name ruby-pkg-#{ENV.fetch('RUBY_VERSION')} -e RUBY_VERSION=#{ENV.fetch('RUBY_VERSION')} -t ruby-pkg}
end

desc 'Copy the built package out of the docker container'
task :copy do
  sh %Q{docker cp ruby-pkg-#{ENV.fetch('RUBY_VERSION')}:/tmp . && mv tmp/*.deb . && rm -rf tmp}
end

task :version do
  begin
    ENV.fetch('RUBY_VERSION')
  rescue KeyError => e
    puts %Q{A ruby version is required.

  e.g. RUBY_VERSION=2.1.5 rake

}
    exit 1
  end
end

task default: [:version, :build, :package, :copy]
