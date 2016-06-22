class Runner
  TASKS=%w(transpose)
  attr_reader :task, :args

  def initialize(*args)
    @task = args.shift
    @args = args
    require task
  end

  def run
    if task
      runner.run
    else
      puts tasks
      tasks.each do |task|
        self.class.new(task).run
      end
    end
  end

  private

  def tasks
    self.class.const_get(:TASKS)
  end

  def clazz
    eval("#{self.class.to_s}::#{task.capitalize}")
  end

  def runner
    @runner ||= clazz.new(*args)
  end

  def require(file)
    super("./#{self.class.name.downcase.gsub(/::/, '/')}/#{file}")
  end
end

Runner.new(*ARGV).run
