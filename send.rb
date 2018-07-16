#!/usr/bin/env ruby
require 'bunny'

user_input = ARGV.join(" ")

connection = Bunny.new(automatically_recover: false)
connection.start

channel = connection.create_channel
queue = channel.queue('hello')

channel.default_exchange.publish(user_input, routing_key: queue.name)
puts " [x] Sent '#{user_input}'"

connection.close
