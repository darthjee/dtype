require './tasks/erb_builder'
require './tasks/tex'
require './tasks/tex/transpose'

namespace :tex do
  desc 'build tex document'
  task :build, [:name,:input,:output] do |_task, args|
    input = args[:input]
    output = args[:output]

    Tex::Transpose.new(input, output).build
  end
end

