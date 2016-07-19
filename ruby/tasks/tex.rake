require './lib/erb_builder'
require './lib/tex'
require './lib/tex/transpose'

namespace :tex do
  desc 'build tex document'
  task :build, [:name,:input,:output] do |_task, args|
    input = args[:input]
    output = args[:output]

    Tex::Transpose.new(input, output).build
  end

  desc 'return the requirements for tex building'
  task :requirements, [:name] do |_task, args|
    name = args[:name]
    requirements =  [ "lib/#{name}.rb" ]
    puts requirements.map { |r| "../../ruby/#{r}" }
  end
end

