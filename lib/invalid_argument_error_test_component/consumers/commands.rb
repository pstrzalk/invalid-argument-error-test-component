# Consumer user guide: http://docs.eventide-project.org/user-guide/consumers.html

module InvalidArgumentErrorTestComponent
  module Consumers
    class Commands
      include Consumer::Postgres

      handler Handlers::Commands

      def error_raised(error, message_data)
        if error.instance_of?(MessageStore::ExpectedVersion::Error)
          self.(message_data)
        else
          raise error
        end
      end
    end
  end
end
