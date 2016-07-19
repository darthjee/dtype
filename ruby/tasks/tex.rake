require './tasks/erb_builder'
require './tasks/tex'

namespace :tex do
  desc 'build tex document'
  task :build, [:name,:input,:output] do |_task, args|
    input = args[:input]
    output = args[:output]

    puts args
    #Tex.new(input, output)
  end
end

