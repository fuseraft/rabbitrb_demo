# frozen-string-literal: true

require 'bunny'
require 'json'
require 'faker'

# connect to rabbit, open a channel, declare a queue
connection = Bunny.new(hostname: 'localhost')
connection.start

channel = connection.create_channel

queue_name = 'my_queue'
channel.queue(queue_name)

# generate 100 mock messages, publish them to the queue for the consumers to process.
100.times do |i|
  message = {
    id: i + 1,
    name: Faker::Name.name,
    email: Faker::Internet.email
  }
  channel.default_exchange.publish(message.to_json, routing_key: queue_name)
  puts "Published: #{message.to_json}"
end

connection.close
