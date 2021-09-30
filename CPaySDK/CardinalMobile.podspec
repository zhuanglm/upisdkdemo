Pod::Spec.new do |s|
  s.name = "CardinalMobile"
  s.version = "0.0.1"
  s.summary = "A short description of CPay_framework."
  s.homepage         = 'https://github.com/citcon/cpay_framework'
  s.license          =  "MIT"
  s.authors = {"brownfeng"=>"text@example.com"}
  s.description = "TODO: Add long description of the pod here."
  s.frameworks = ["UIKit", "AVFoundation", "MobileCoreServices", "CoreVideo", "Accelerate", "Security", "SystemConfiguration", "CoreMedia", "AudioToolbox", "CoreTelephony", "ImageIO","WebKit"]
  # s.libraries = ["c++","z"]
  s.source = { :path => '.' }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'CardinalMobile.xcframework'
end
