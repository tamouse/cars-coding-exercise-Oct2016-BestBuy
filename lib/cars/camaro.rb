require "cars/base"

module Cars


  class Camaro < Base

    def initialize(*args)
      super
      self.brand     = "Chevy"
      self.max_speed = 200
    end

  end

end
