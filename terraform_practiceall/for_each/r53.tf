resource "aws_route53_record" "www" {
  for_each = aws_instance.example
  zone_id = var.zone_id
  name    = "${each.key}.${var.domian_name}"
  type    = "A"
  ttl     = "1"
  records = [each.value.private_ip]
  allow_overwrite = true
}