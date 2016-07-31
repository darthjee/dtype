require './lib/data'
require './lib/data/transpose'
require './lib/data/transpose/binomial'
require 'active_support/inflector'

namespace :data do
  desc 'List all datas to be processed'
  task :list, [:project] do |_task,args|
    project = args[:project]
    project_class = "Data::#{project.camelize}".constantize
    
    puts project_class::TASKS
  end

  desc 'Creates data'
  task :create, [:project,:report] do |_task, args|
    project = args[:project]
    report = args[:report]

    project_class = "Data::#{project.camelize}".constantize
    report_class = "#{project_class}::#{report.camelize}".constantize

    report_class.new.run
  end

  desc 'List data requirements'
  task :requirements, [:project, :report] do |_task, args|
    project = args[:project]
    report = args[:report]

    project_class = project.camelize.constantize
    report_class = "#{project_class}::Data::#{report.camelize}".constantize

    requirements =  report_class::REQUIREMENTS + [ "lib/#{project}/data/#{report}.rb" ]
    puts requirements.map { |r| "../ruby/#{r}" }
  end
end

