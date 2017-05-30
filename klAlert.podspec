#
#  Be sure to run `pod spec lint klAlert.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "klAlert"
  s.version      = "1.0.1"
  s.summary      = "Simple one call alerts with completions in Swift."
  s.description  = <<-DESC
	UIAlertController is pretty cool, but it means having to write a few lines of code where before one call was often all you'd need. klAlert is a series of static functions that let you create and handle the results of a modern alert in just one call.
                   DESC

  s.homepage     = "https://github.com/kenlaws/klAlert"
  s.license      = "MIT"
  s.author             = { "Ken Laws" => "pods@kenlaws.com" }
  s.social_media_url   = "https://twitter.com/kenlaws"

  #  When using multiple platforms
  s.ios.deployment_target = "9.0"
  # s.osx.deployment_target = "10.12"
  #s.watchos.deployment_target = "3.2"
  #s.tvos.deployment_target = "10.2"

  s.source       = { :git => "https://github.com/kenlaws/klAlert.git", :tag => s.version.to_s }

  s.source_files  = "klAlert"
  s.framework = "UIKit"
  s.requires_arc = true

end
