# frozen-string-literal: true

require 'bunny'
require 'thread'

interrupted = false

# A generic signal trap to tell the program to end the connection to rabbit
Signal.trap('INT') do
  puts 'Signal caught, preparing to shutdown...'
  interrupted = true
end

# connect to rabbit, open a channel, declare a queue
connection = Bunny.new(hostname: 'localhost')
connection.start
channel = connection.create_channel
queue = channel.queue('my_queue')

# subscribe to the queue
queue.subscribe(block: false) do |_delivery_info, _properties, body|
  puts "Received: #{body}" # handle a message
end

# keep alive
while !interrupted do
  sleep 1
end

# connection cleanup
channel.close
connection.close