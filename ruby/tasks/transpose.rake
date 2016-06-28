require './tasks/transpose'
require './tasks/transpose/data'
require './tasks/transpose/data/binomial'

namespace :transpose do
  namespace :data do
    task :all do
      Rake::Task['transposition:data'].execute
    end

    desc 'List all datas to be processed'
    task :list do
      puts Transpose::Data::TASKS
    end

    desc 'Creates transposition data'
    task :binomial do
      Transpose::Data.new.run
    end
  end
end

