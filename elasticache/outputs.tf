output "redis_security_group_id" {
  value = aws_security_group.redis.id
}

output "redis_primary_endpoint_address" {
  value = aws_elasticache_replication_group.redis.primary_endpoint_address
}

output "redis_reader_endpoint_address" {
  value = aws_elasticache_replication_group.redis.reader_endpoint_address
}
