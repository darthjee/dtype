require './tasks/transpose'
require './tasks/transpose/data'
require './tasks/transpose/data/binomial'

namespace :transpose do
  task :all do
    Rake::Task['transposition:data'].execute
  end

  desc 'Creates transposition data'
  task :data do
    Transpose::Data.new.run
  end
end

