require './lib/array'
require './lib/data'
require './lib/data/transpose'
require './lib/data/transpose/binomial'
require 'active_support/inflector'

namespace :data do
  desc 'List all datas to be processed'
  task :list, [:project] do |_task,args|
    project = args[:project]
    project_class = %W(data #{project}).require_constantize
    
    puts project_class::TASKS
  end

  desc 'Creates data'
  task :create, [:project,:report] do |_task, args|
    project = args[:project]
    report = args[:report]

    report_class = %W(data #{project} #{report}).require_constantize

    report_class.new.run
  end

  desc 'List data requirements'
  task :requirements, [:project, :report] do |_task, args|
    project = args[:project]
    report = args[:report]

    class_path = %W(data #{project} #{report})
    report_class = class_path.require_constantize

    requirements =  report_class::REQUIREMENTS + [ "#{class_path.join('/')}.rb" ]
    puts requirements.map { |r| "../ruby/lib/#{r}" }
  end
end

