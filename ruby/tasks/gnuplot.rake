require './lib/initializer'

namespace :gnuplot do
  desc 'build gnuplot document'
  task :build, [:project,:graph,:input,:output] do |_task, args|
    project = args[:project]
    graph = args[:graph]
    input = args[:input]
    output = args[:output]

    project_class = %W(gnuplot #{project} #{graph}).loader.require_constantize

    project_class.new(input, output).build
  end

  desc 'return the requirements for gnuplot building'
  task :requirements, [:project,:graph] do |_task, args|
    project = args[:project]
    graph = args[:graph]

    requirements =  Utils::Loader.requirements("gnuplot/#{project}/#{graph}")

    puts requirements.map { |r| r.gsub(/^\.(.*)/,"#{Dir.pwd}\\1.rb") }.join(' ')
  end
end

