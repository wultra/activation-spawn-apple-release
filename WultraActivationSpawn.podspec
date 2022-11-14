Pod::Spec.new do |s|
  s.cocoapods_version   = '>= 1.10'
  s.name                = "WultraActivationSpawn"
  s.version             = "1.3.0"
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
      ./prepare.sh 1.3.0 76fcd5112415aad1dfd3a4b17a3d100ac09cf411ec897b9352c3ca15e8b5b200
  CMD
  s.vendored_frameworks = "WultraActivationSpawn.xcframework"
  
  s.platform            = :ios
  s.swift_version       = "5.7"
  s.ios.deployment_target  = '11.0'

  s.dependency 'WultraDeviceFingerprint', '~> 1.3.2'
  s.dependency 'WultraPowerAuthNetworking', '~> 1.1.4'
end