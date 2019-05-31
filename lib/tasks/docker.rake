# frozen_string_literal: true

namespace :docker do
  desc 'docker-compose build [args]'
  task :build do |_t, args|
    sh("docker-compose build #{args}")
  end

  desc 'docker-compose up [args]'
  task :start do |_t, args|
    sh("docker-compose up #{args}")
  end

  desc 'docker-compose -f docker-compose.test.yml run --rm web'
  task :test do
    sh('docker-compose -f docker-compose.test.yml run --rm web')
  end
end
