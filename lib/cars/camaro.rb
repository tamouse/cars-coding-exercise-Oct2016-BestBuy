require "cars/base"

module Cars


  class Camaro < Base

    def initialize(*args)
      super
      self.brand = "Chevy"
      self.max_velocity = 200
    end

  end

end
