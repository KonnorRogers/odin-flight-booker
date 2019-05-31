# frozen_string_literal: true

namespace :docker do
  desc 'docker-compose build'
  task :build do
    sh('docker-compose build')
  end

  desc 'docker-compose up web'
  task :start do
    sh('docker-compose up web')
  end

  desc 'docker-compose -f docker-compose.test.yml run --rm web'
  task :test do
    sh('docker-compose -f docker-compose.test.yml run --rm web')
  end
end
