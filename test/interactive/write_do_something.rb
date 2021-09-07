#!/usr/bin/env ruby

require_relative './interactive_init'

include InvalidArgumentErrorTestComponent::Messages::Commands

do_something_command = DoSomething.build.tap do |command|
  command.something_id = "581a4867-42c9-4d90-94d4-5df216186cc9"
  command.details = DoSomething::Details.new(id: 6, name: "Johhny")
end

stream_name = Messaging::StreamName.command_stream_name(
  do_something_command.something_id, "invalidArgumentErrorTest"
)

Messaging::Postgres::Write.(do_something_command, stream_name)
