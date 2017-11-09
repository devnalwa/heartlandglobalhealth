SecureHeaders::Configuration.default do |config|
  config.hsts = "max-age=#{2.years.to_i}; includeSubDomains; preload"
  config.x_frame_options        = "DENY"
  config.x_content_type_options = "nosniff"
  config.x_xss_protection       = "1; mode=block"
  config.referrer_policy        = "same-origin"
  config.x_download_options     = "noopen"
  config.x_permitted_cross_domain_policies = "none"
  config.csp = {
    base_uri:    %w('self'),
    default_src: %w(https: 'none'),
    script_src:  %w('self' cdnjs.cloudflare.com *.gstatic.com *.google.com *.googleapis.com),
    style_src:   %w('self' cdnjs.cloudflare.com 'unsafe-inline'),
    img_src:     %w('self' data:),
    object_src:  %w('none')
  }
end
