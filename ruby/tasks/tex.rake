require './lib/initializer'

namespace :tex do
  desc 'build tex document'
  task :build, [:name,:input,:output] do |_task, args|
    name = args[:name]
    input = args[:input]
    output = args[:output]

    project_class = %W(tex #{name}).loader.constantize

    project_class.new(input, output).build
  end
end

