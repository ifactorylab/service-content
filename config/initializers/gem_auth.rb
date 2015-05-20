if Rails.env.production?
  uri = URI.parse(ENV["REDISCLOUD_URL"])
else
  uri = URI.parse("redis://rediscloud:N8WpTcgrJPZvKAz9@pub-redis-16803.us-east-1-1.1.ec2.garantiadata.com:16803")
end

GemAuth.redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
