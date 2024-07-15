data "aws_route53_zone" "my_personal_zone"{
  name = "mingyu110.com"
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.my_personal_zone.id
  name    = "mingyu110.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.portfolio_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.portfolio_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}