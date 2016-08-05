require './lib/core/array'
require './lib/core/class'

namespace :data do
  desc 'List all datas to be processed'
  task :list, [:project] do |_task,args|
    project = args[:project]
    project_class = %W(data #{project}).loader.require_constantize
    
    puts project_class::TASKS
  end

  desc 'Creates data'
  task :create, [:project,:report] do |_task, args|
    project = args[:project]
    report = args[:report]

    report_class = %W(data #{project} #{report}).loader.require_constantize

    report_class.new.run
  end

  desc 'List data requirements'
  task :requirements, [:project, :report] do |_task, args|
    project = args[:project]
    report = args[:report]

    class_path = %W(data #{project} #{report})
    report_class = class_path.loader.require_constantize

    requirements =  Utils::Loader.loaded 
    puts requirements.map { |r| r.gsub(/^\.(.*)/,'../ruby\1.rb') }.join(' ')
  end
end

