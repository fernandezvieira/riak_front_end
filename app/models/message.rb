require 'json'

class Message < ActiveRecord::Base
  
  def self.new_message
  end
  
  def self.query(url)
    %x[curl #{url}]
  end
  
  def self.get_messages
    response = query("#{RIAK_URL}/riak/mts?keys=true")
    keys = JSON.parse(response)["keys"]
    @messages = []
    keys.each do |key|
      message = JSON.parse(query("#{RIAK_URL}/riak/mts/#{key}"))
      @messages << [key, message]
    end
    @messages
  end
  
  def self.get_by_node(node)
    response = query("#{RIAK_URL}/buckets/mts/index/node_bin/#{node}")
    keys = JSON.parse(response)["keys"]
    @messages = []
    keys.each do |key|
      message = JSON.parse(query("#{RIAK_URL}/riak/mts/#{key}"))
      @messages << [key, message]
    end
    @messages
  end
  
  def self.get_by_key(key)
    message = JSON.parse(query("#{RIAK_URL}/riak/mts/#{key}"))
  end
  
end
