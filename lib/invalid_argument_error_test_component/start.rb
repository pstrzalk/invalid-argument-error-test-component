# Component initiator user guide: http://docs.eventide-project.org/user-guide/component-host.html#component-initiator

module InvalidArgumentErrorTestComponent
  module Start
    def self.call
      Consumers::Commands.start("invalidArgumentErrorTest:command")
    end
  end
end
