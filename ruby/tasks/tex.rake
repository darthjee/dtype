require './lib/initializer'

namespace :tex do
  desc 'build tex document'
  task :build, [:name,:input,:output] do |_task, args|
    name = args[:name]
    input = args[:input]
    output = args[:output]

    project_class = %W(tex #{name}).loader.require_constantize

    project_class.new(input, output).build
  end

  desc 'return the requirements for tex building'
  task :requirements, [:name] do |_task, args|
    name = args[:name]

    requirements =  Utils::Loader.requirements("tex/#{name}")

    puts requirements.map { |r| r.gsub(/^\.(.*)/,'../../ruby\1.rb') }.join(' ')
  end
end

