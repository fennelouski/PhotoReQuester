# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
# use_frameworks!

target 'Photo ReQuester' do
pod 'FBSDKCoreKit'
pod 'FBSDKLoginKit'
pod 'Google/SignIn'
pod 'AFNetworking'
end

post_install do
  %w[AFNetworkReachabilityManager.m AFHTTPSessionManager.m].each do |name|
    path = "Pods/AFNetworking/AFNetworking/#{name}"
    source = File.read(path)
    File.write(path, source.gsub(/^#import <netinet6\/in6\.h>\n/, ''))
  end
end

