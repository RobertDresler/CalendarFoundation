Pod::Spec.new do |s|

  s.name         = "CalendarFoundation"
  s.version      = "0.0.4"
  s.summary      = "Simple calendar"
 s.platform     = :ios
s.ios.deployment_target  = '11.0'
s.swift_version = '4.2'
  s.description  = <<-DESC
  Simple calendar for Swift projects
                      DESC

  s.homepage     = "https://github.com/RobertDresler/CalendarFoundation"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "RobertDresler" => "robertdreslerjr@gmail.com" }
  s.social_media_url   = "https://twitter.com/rdreslerjr"

  s.source = { :git => "https://github.com/RobertDresler/CalendarFoundation.git", :tag => s.version }
  s.source_files = "CalendarFoundation/**/*.{swift}"
s.resources = "CalendarFoundation/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
end
