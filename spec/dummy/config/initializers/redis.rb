$redis = Redis.new(host: "localhost")

AllAboard.redis = $redis
Resque.redis = $redis
