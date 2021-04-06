Pod::Spec.new do |s|
  s.name             = 'Parma'
  s.version          = '0.2.0'
  s.summary          = 'A SwiftUI view for displaying Markdown with customizable appearances.'
  s.description      = 'Display Markdown using pure SwiftUI components. Taking advantages of ViewBuilder to make custom appearances for Text and View.'
  s.homepage         = 'https://github.com/dasautoooo/Parma'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Leonard Chan' => 'wxclx98@gmail.com' }
  s.source           = { :git => 'https://github.com/dasautoooo/Parma.git', :tag => "v" + s.version.to_s }
  s.social_media_url = 'https://twitter.com/DasAutoooo'

  s.swift_version = '5.0'

  s.ios.deployment_target = '13.0'
  s.osx.deployment_target  = '10.15'
  s.watchos.deployment_target = '7.0'
  
  s.source_files = 'Sources/**/*'

  s.dependency 'Down', '~> 0.9.3'
end
