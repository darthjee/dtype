require './lib/transpose'
require './lib/transpose/data'
require './lib/transpose/data/binomial'
require 'active_support/inflector'

namespace :data do
  desc 'List all datas to be processed'
  task :list, [:project] do |_task,args|
    project = args[:project]

    puts project.camelize.constantize::Data::TASKS
  end

  desc 'Creates data'
  task :create, [:project,:report] do |_task, args|
    project = args[:project]
    report = args[:report]

    project_class = project.camelize.constantize
    report_class = "#{project_class}::Data::#{report.camelize}".constantize

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

