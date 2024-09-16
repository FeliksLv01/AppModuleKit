Pod::Spec.new do |s|
  s.name             = 'AppModuleKit'
  s.version          = '0.0.1'
  s.summary          = 'Split AppDelegate Into Different Modules'
  s.homepage         = 'https://github.com/felikslv01/AppModuleKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'felikslv' => 'felikslv@163.com' }
  s.source           = { :git => 'https://github.com/felikslv01/AppModuleKit.git', :tag => s.version.to_s }

  s.platform = :ios
  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.prefix_header_file = false
  s.source_files = 'Source/*.swift'
  s.frameworks = 'UIKit'
end
