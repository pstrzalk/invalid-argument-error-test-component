module InvalidArgumentErrorTestComponent
  module Handlers
    class Commands
      include Messaging::Handle
      include Messaging::StreamName
      include Log::Dependency
      include Messages::Commands

      category :invalid_argument_error_test

      handle DoSomething do |do_something|
        pp "handling DoSomething", do_something

        raise MessageStore::ExpectedVersion::Error
      end
    end
  end
end
