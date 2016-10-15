module Cars

  class Base
    attr_accessor :current_speed, :max_speed, :brand, :reporter

    def initialize(
        reporter: $stdout
        )

      self.current_speed = 0
      self.brand         = "unknown"
      self.max_speed     = 0
      self.reporter      = reporter
    end

    def drive
      while current_speed < max_speed
        accelerate
      end
      reporter.puts "Car #{brand} #{model} reached maximum speed of #{current_speed}"
      stop
    end

    def accelerate
      self.current_speed += 1
      reporter.print "."
    end

    def stop
      self.current_speed = 0
    end

    def model
      self.class.name.rpartition(/::/).last
    end

  end

end
