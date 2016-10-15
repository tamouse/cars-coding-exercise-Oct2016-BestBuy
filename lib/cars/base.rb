module Cars

  class Base
    attr_accessor :velocity, :max_velocity, :brand, :reporter

    def initialize(
        reporter: $stdout
        )

      self.velocity = 0
      self.brand = "unknown"
      self.max_velocity = 0
      self.reporter = reporter
    end

    def drive
      while velocity < max_velocity
        accelerate
      end
      reporter.puts "Car #{brand} #{model} reached maximum velocity of #{velocity}"
      stop
    end

    def accelerate
      self.velocity += 1
      reporter.print "."
    end

    def stop
      self.velocity = 0
    end

    def model
      self.class.name.rpartition(/::/).last
    end

  end

end
