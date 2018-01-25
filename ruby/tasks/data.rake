require './lib/initializer'

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
end

