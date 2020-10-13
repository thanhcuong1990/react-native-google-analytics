require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))
ios_root = 'ios'
galib_root = ios_root + '/google-analytics-lib'

Pod::Spec.new do |s|
  s.name         = 'RNGoogleAnalytics'
  s.version      = package['version']
  s.summary      = package['description']
  s.author       = 'Cuong Lam'

  s.homepage     = package['homepage']

  s.license      = package['license']
  s.platform     = :ios, '9.0'

  s.source       = { git: 'https://github.com/thanhcuong1990/react-native-google-analytics', tag: "v#{s.version}" }
  s.default_subspec = 'Core'

  s.subspec 'Core' do |ss|
    ss.dependency 'React-Core'
    ss.frameworks = 'CoreData', 'SystemConfiguration'
    ss.libraries = 'z', 'sqlite3.0', 'GoogleAnalyticsServices'
    ss.vendored_libraries = galib_root + '/libGoogleAnalyticsServices.a'

    ss.source_files = galib_root + '/*.{h}', ios_root + '/**/*.{h,m}'
  end

  s.subspec 'adSupport' do |ss|
    ss.dependency       'rn-google-analytics/Core'
    ss.frameworks = 'AdSupport'
    ss.libraries = 'AdIdAccess'
    ss.vendored_libraries = galib_root + '/libAdIdAccess.a'
  end
end
