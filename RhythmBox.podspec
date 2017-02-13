#
# Be sure to run `pod lib lint RhythmBox.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RhythmBox'
  s.version          = '1.0.1'
  s.summary          = 'A Rhythm Box System for your iOS app 🎵'
  s.description      = <<-DESC
The easiest way to create Music Rhythm Patterns in Swift. A **Rhythm Box** System for your iOS app 🎵.
DESC
  s.homepage         = 'https://github.com/manuelescrig/RhythmBox'
  s.screenshots      = 'https://github.com/manuelescrig/RhythmBox/blob/master/Slice%201.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Manuel Escrig Ventura' => 'manuelescrig@gmail.com' }
  s.source           = { :git => 'https://github.com/manuelescrig/RhythmBox.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/manuelescrig'
  s.ios.deployment_target = '8.0'
  s.source_files = 'RhythmBox/Classes/**/*'

end
