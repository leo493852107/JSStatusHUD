Pod::Spec.new do |s|
  s.name         = "JSStatusHUD"
  s.version      = "0.0.1"
  s.ios.deployment_target = '7.0'

  s.summary      = "HUD for top window reminder"
  s.homepage     = "https://github.com/leo493852107/JSStatusHUD"
  s.license      = "MIT"
  s.author             = { "leo" => "leo493852107@163.com" }
  s.social_media_url   = "http://weibo.com/exceptions"
  s.source       = { :git => "https://github.com/leo493852107/JSStatusHUD.git", :tag => s.version }
  s.source_files  = "JSStatusHUD"
  s.requires_arc = true
end