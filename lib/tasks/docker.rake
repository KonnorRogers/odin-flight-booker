# frozen_string_literal: true

namespace :docker do
  desc 'rails docker:build [args]', 'runs: docker-compose build [args]'
  task :build do |_t, args|
    sh("docker-compose build #{args}")
  end

  desc 'rails docker:start', 'runs: docker-compose up [args]'
  task :start do |_t, args|
    sh("docker-compose up #{args}")
  end

  desc 'rails docker:test', 'runs: docker-compose -f docker-compose.test.yml run --rm web'
  task :test do
    sh('docker-compose -f docker-compose.test.yml run --rm web')
  end
end
