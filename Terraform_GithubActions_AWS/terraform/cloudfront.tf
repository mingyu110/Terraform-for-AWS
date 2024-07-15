resource "aws_cloudfront_access_control" "portfolio_oac" {
  name    = "OAC for Portfolio Website"
  description = "OAC for mingyu110 portfolio website"
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}

resource "aws_cloudfront_distribution" "portfolio_distribution" {
  enabled = true
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "S3-mingyu110-portfolio"
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
  }
  origin {
    domain_name = aws_s3_bucket.personal_portfolio_bucket.bucket_regional_domain_name
    origin_id   = "S3-mingyu110-portfolio"
    origin_access_control_id = aws_cloudfront_origin_access_control.portfolio_oac.id
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.web_portfolio_cert.arn
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_certificate_type = "AMAZON_ACM_CERT"
  }
  tags = {
    Environment = "production"
  }
}