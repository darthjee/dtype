require './tasks/erb_builder'
require './tasks/tex'

namespace :tex do
  desc 'build tex document'
  task :build, [:name,:input,:output] => [:environment] do
    input = args[:input]
    output = args[:output]

    Tex.new(input, output)
  end
end

