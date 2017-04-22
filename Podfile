# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Anvil Hack' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Anvil Hack
  pod 'EstimoteSDK'
  pod 'Alamofire'
  pod 'SkyFloatingLabelTextField'

  def testPods
    pod 'Quick'
    pod 'Nimble'
    pod 'Mockingjay'
  end

  target 'Anvil HackTests' do
    inherit! :search_paths
    testPods
  end

  target 'Anvil HackUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
