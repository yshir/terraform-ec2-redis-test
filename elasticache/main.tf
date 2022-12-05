resource "aws_elasticache_replication_group" "redis" {
  engine         = "redis"
  engine_version = "6.2"
  node_type      = "cache.t3.micro"

  replication_group_id = var.prefix
  description          = "Redis for ${var.prefix}"

  num_cache_clusters         = var.node_count
  automatic_failover_enabled = var.node_count == 1 ? false : true

  subnet_group_name  = aws_elasticache_subnet_group.redis.name
  security_group_ids = [aws_security_group.redis.id]

  tags = { Name = "${var.prefix}-redis" }
}

resource "aws_elasticache_subnet_group" "redis" {
  name        = "${var.prefix}-redis-subnet" # cannot use "_"
  description = "Redis Subnet Group"

  subnet_ids = var.private_subnet_ids
}

resource "aws_security_group" "redis" {
  name        = "${var.prefix}-redis-sg"
  description = "Security Group for Elasticahe"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
