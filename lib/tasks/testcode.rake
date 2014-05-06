namespace :testcode do
  unless Rails.env == 'production'

    desc 'Execute Rspec'
    require 'rspec/core/rake_task'
    RSpec::Core::RakeTask.new(:spec) do |tsk|
      tsk.rspec_opts = '--format p'
    end

    desc 'Execute rubocop -DR'
    require 'rubocop/rake_task'
    # bug in current version 0.21.0 - runs twice
    Rubocop::RakeTask.new(:rubocop) do |tsk|
      tsk.options = ['-DR'] # Rails, display cop name
      tsk.fail_on_error = false
    end

    desc 'Execute haml-lint'
    task haml_lint: :environment do
      puts "HAML-LINT"
      puts %x{haml-lint .}
    end

    desc 'Execute rails_best_practices'
    task rbp: :environment do
      require 'rails_best_practices'
      analyzer = RailsBestPractices::Analyzer.new('.')
      analyzer.analyze
      puts analyzer.output
    end

    desc 'Execute reek on app, lib, config and rake files'
    task reek: :environment do
      require 'reek/rake/task'
      puts "REEK"
      ['app','lib','lib/tasks/*.rake','config'].each do |path|
        Reek::Rake::Task.new do |tsk|
          tsk.source_files = path
          tsk.fail_on_error = false
        end
      end
    end
  end
end

task :testcode do
  Rake.application.in_namespace(:testcode){|nspace| nspace.tasks.each{|task| task.invoke}}
end
