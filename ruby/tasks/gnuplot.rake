require './lib/initializer'

namespace :gnuplot do
  desc 'List all gnu files to be processed'
  task :list, [:project] do |_task,args|
    project = args[:project]
    project_class = %W(gnuplot #{project}).loader.constantize

    puts project_class::TASKS
  end

  desc 'build gnuplot document'
  task :build, [:project,:graph,:input,:output] do |_task, args|
    project = args[:project]
    graph = args[:graph]
    input = args[:input]
    output = args[:output]

    project_class = %W(gnuplot #{project} #{graph}).loader.constantize

    project_class.new(input, output).build
  end
end

