redis = Redis.new(url: ENV['REDIS_URL'])
$redis = Redis::Namespace.new(ENV['REDIS_NAMESPACE'], redis: redis)

ArcticPortal::Application.config.cache_store = :redis_store,
  $redis.client.id + "/cache"

ArcticPortal::Application.config.session_store :redis_store,
  redis_server: $redis.client.id + "/session"

ArcticPortal::Application.config.action_dispatch.rack_cache = {
    :metastore    => $redis.client.id + "/metastore",
    :entitystore  => $redis.client.id + "/entitystore",
    :verbose      => false
  }

ArcticPortal::Application.config.assets.cache_store = :redis_store, {
  url: ENV['REDIS_URL'],
  namespace: 'assets'
}
