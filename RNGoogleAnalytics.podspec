require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "RNGoogleAnalytics"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.author       = "Cuong Lam"

  s.homepage     = package["homepage"]

  s.license      = package["license"]
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/thanhcuong1990/react-native-google-analytics", :tag => "v#{s.version}" }
  s.dependency 'React'
  s.dependency "GoogleAnalytics"
  s.dependency 'GoogleTagManager'
end
