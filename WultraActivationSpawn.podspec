Pod::Spec.new do |s|
  s.cocoapods_version   = '>= 1.10'
  s.name                = "WultraActivationSpawn"
  s.version             = "2.0.1"
  s.summary             = "PowerAuth Activation Spawn by Wultra"
  s.homepage            = "https://www.powerauth.com/"
  s.social_media_url    = 'https://twitter.com/wultra'
  s.author              = { 'Wultra s.r.o.' => 'support@wultra.com' }
  s.source              = { :git => 'https://github.com/wultra/device-fingerprint-apple-release.git', :tag => "#{s.version}" }
  s.license             = { :type => 'proprietary', :text => <<-LICENSE
    Copyright (c) 2021, Wultra s.r.o. (www.wultra.com).
    
    All rights reserved. This source code can be used only for purposes specified
    by the given license contract signed by the rightful deputy of Wultra s.r.o.
    This source code can be used only by the owner of the license.
    
    Any disputes arising in respect of this agreement (license) shall be brought
    before the Municipal Court of Prague.
  LICENSE
  }
  s.prepare_command = <<-CMD
      ./prepare.sh 2.0.1 70c3d31a3ec69ddb42b0e2b53029dd38e408657ab08cf8b1d86273a552ebdc11
  CMD
  s.vendored_frameworks = "WultraActivationSpawn.xcframework"
  
  s.platform            = :ios
  s.swift_version       = "5.9"
  s.ios.deployment_target  = '12.0'

  s.dependency 'WultraDeviceFingerprint', '~> 1.4.0'
  s.dependency 'WultraPowerAuthNetworking', '~> 1.2.0'
end