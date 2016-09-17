Pod::Spec.new do |s|
  s.name         = "SZCombox"
  s.version      = "0.0.1"
  s.summary      = "下拉列表，支持文字显示或者图标和文字同时显示"
  s.homepage     = "https://github.com/SZ8023/SZCombox"
  s.license      = "MIT"
  s.author             = { "sunzhen" => "styshy@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/SZ8023/SZCombox.git", :tag =>"4ff144c42486a37b5d7275d7f0ddeee14b14b2d8" }
  s.source_files  = "SZCombox", "SZCombox/**/*.{h,m}"
  s.resources = "szResource.bundle/*.png"
  s.frameworks = "UIKit"

end
