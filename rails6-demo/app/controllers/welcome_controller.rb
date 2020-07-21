class WelcomeController < ApplicationController
  def index
    #connect to redis server by name & port
    redis = Redis.new(host: "redis", port: 6379)
    #increment the key [page hits]. Redis initialized with zero if key not found.
    redis.incr "page hits"
    ##read the value of the key [page hits]
    @page_hits = redis.get "page hits"
    
  end
end
