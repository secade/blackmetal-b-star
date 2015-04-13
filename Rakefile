require_relative "config/environment"


task :default => :spec


desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r ./config/environment"
end

namespace :generate do
  desc "Create an empty model in app/models, e.g., rake generate:model NAME=User"
  task :model do
    unless ENV.has_key?('NAME')
      raise "Must specificy model name, e.g., rake generate:model NAME=User"
    end

    model_name     = ENV['NAME'].camelize
    model_filename = ENV['NAME'].underscore + '.rb'
    model_path = APP_ROOT.join('app', 'models', model_filename)

    if File.exist?(model_path)
      raise "ERROR: Model file '#{model_path}' already exists"
    end

    puts "Creating #{model_path}"
    File.open(model_path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class #{model_name} < ActiveRecord::Base
          # Remember to create a migration!
        end
      EOF
    end
  end

  desc "Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks"
  task :migration do
    unless ENV.has_key?('NAME')
      raise "Must specificy migration name, e.g., rake generate:migration NAME=create_tasks"
    end

    name     = ENV['NAME'].camelize
    filename = "%s_%s.rb" % [Time.now.strftime('%Y%m%d%H%M%S'), ENV['NAME'].underscore]
    path     = APP_ROOT.join('db', 'migrate', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class #{name} < ActiveRecord::Migration
          def change
          end
        end
      EOF
    end
  end
end

namespace :db do
  desc "Create the database"
  task :create do
    touch "db/blackmetal.sqlite3"
  end


  desc "Drop the database"
  task :drop do
    rm_f "db/blackmetal.sqlite3"
  end


  desc "Migrate the database"
  task :migrate do
    # Ensure that we see the output when running migrations
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true

    # Tell ActiveRecord where to find the migration files and run them
    migrations_directory = "#{APP_ROOT}db/migrate"
    ActiveRecord::Migrator.migrations_paths << migrations_directory
    ActiveRecord::Migrator.migrate ActiveRecord::Migrator.migrations_paths
  end

  desc "rollback your migration--use STEPS=number to step back multiple times"
  task :rollback do
    number_of_steps = (ENV['STEPS'] || 1).to_i
    ActiveRecord::Migrator.rollback('db/migrate', number_of_steps)

    # Run the db:version rake task
    Rake::Task['db:version'].invoke if Rake::Task['db:version']
  end

  desc "Returns the current schema version number"
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end

  desc "Populate the database with dummy data by running db/seeds.rb"
  task :seed do
    require APP_ROOT.join('db', 'seeds.rb')
  end
end