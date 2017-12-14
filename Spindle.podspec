#
# Be sure to run `pod lib lint Spindle.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Spindle'
  s.version          = '0.1.0'
  s.summary          = 'A lightweight library for making DispatchQueues identifiable.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = 'This library allows you to create identifiable DispatchQueues. After creating an IdentifiableDispatchQueue you can determine if the current queue is your queue by using the class function `currentQueueIs(_:)`. This library can be used to help debug deadlocks, aid in switching over to a lock-less system, as well as help with maintaining synchronous database writes while preventing deadlocks.\n\nThe only caveat is that you cannot use a default global queues as the underlying queue as all concurrent queues ultimately retarget the global queue with the corresponding qos. This means that if global queues were allowed to be used as underlying queues, they would cause false positives when passed into the `currentQueueIs` function during execution on a concurrent queue with the same qos.'

  s.homepage         = 'https://github.com/vhart/Spindle'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'vhart' => 'varindrahart@gmail.com' }
  s.source           = { :git => 'https://github.com/vhart/Spindle.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Spindle/Classes/**/*'

  # s.resource_bundles = {
  #   'Spindle' => ['Spindle/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
end
