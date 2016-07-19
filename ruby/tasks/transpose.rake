require './lib/transpose'
require './lib/transpose/data'
require './lib/transpose/data/binomial'

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

    namespace :binomial do
      desc 'List binomial requirements'
      task :requirements do
        requirements =  Transpose::Data::Binomial::REQUIREMENTS + [ 'lib/transpose/data/binomial.rb' ]
        puts requirements.map { |r| "../ruby/#{r}" }
      end
    end
  end
end

