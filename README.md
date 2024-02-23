# RabbitMQ Ruby Demo

A simple demonstration of subscribing to a queue and processing messages as they arrive.

### Getting Started

You'll need Ruby and Bundler installed. I am using Ruby 3.2.2 and Bundler 2.5.6 for the demo.

You will also need a [RabbitMQ](https://www.rabbitmq.com/docs/download) instance running.

Install the gems.

```shell
bundle install
```

Run the consumer application.

```shell
bundle exec ruby consumer.rb
```

Run the producer application.

```shell
bundle exec ruby producer.rb
```