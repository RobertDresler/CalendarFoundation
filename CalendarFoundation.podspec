Pod::Spec.new do |s|

  s.name         = "CalendarFoundation"
  s.version      = "0.0.1"
  s.summary      = "Simple calendar"

  s.description  = <<-DESC
  Simple calendar for Swift projects
                      DESC

  s.homepage     = "https://github.com/RobertDresler/CalendarFoundation"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "RobertDresler" => "robertdreslerjr@gmail.com" }
  s.social_media_url   = "https://twitter.com/rdreslerjr"

  s.platform     = :ios

  s.source = { :git => "https://github.com/RobertDresler/CalendarFoundation.git", :tag => s.version }
  s.source_files = "CalendarFoundation/*.{m,h}"

end
