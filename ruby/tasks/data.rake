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

  desc 'List data requirements'
  task :requirements, [:project, :report] do |_task, args|
    project = args[:project]
    report = args[:report]

    class_path = "data/#{project}/#{report}"
    requirements =  Utils::Loader.requirements(class_path) 

    puts requirements.map { |r| r.gsub(/^\.(.*)/,"#{Dir.pwd}\\1.rb") }.join(' ')
  end
end

