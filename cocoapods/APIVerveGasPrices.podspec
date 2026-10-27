Pod::Spec.new do |s|
  s.name             = 'APIVerveGasPrices'
  s.version          = '1.2.3'
  s.summary          = 'Gas Prices returns average retail gasoline, diesel and LPG prices from official weekly government surveys for the US, the UK, all 27 EU...'
  s.description      = <<-'DESC'
Gas Prices returns average retail gasoline, diesel and LPG prices from official weekly government surveys for the US, the UK, all 27 EU countries and the EU average. Pass a country, or a US state, region or city, to get the latest week with week-over-week and year-over-year changes, in any currency, per liter or per gallon.

This iOS/macOS SDK provides a convenient way to access the Gas Prices from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/gasprices?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/gasprices-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveGasPrices/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
