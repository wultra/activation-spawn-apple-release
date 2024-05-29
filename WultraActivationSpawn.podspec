Pod::Spec.new do |s|
  s.cocoapods_version   = '>= 1.10'
  s.name                = "WultraActivationSpawn"
  s.version             = "3.0.0"
  s.summary             = "PowerAuth Activation Spawn by Wultra"
  s.homepage            = "https://www.powerauth.com/"
  s.social_media_url    = 'https://twitter.com/wultra'
  s.author              = { 'Wultra s.r.o.' => 'support@wultra.com' }
  s.source              = { :git => 'https://github.com/wultra/device-fingerprint-apple-release.git', :tag => "#{s.version}" }
  s.license             = { :type => 'proprietary', :text => <<-LICENSE
    Copyright (c) 2024, Wultra s.r.o. (www.wultra.com).
    
    All rights reserved. This source code can be used only for purposes specified
    by the given license contract signed by the rightful deputy of Wultra s.r.o.
    This source code can be used only by the owner of the license.
    
    Any disputes arising in respect of this agreement (license) shall be brought
    before the Municipal Court of Prague.
  LICENSE
  }
  s.platform               = :ios
  s.swift_version          = "5.9"
  s.ios.deployment_target  = '12.0'
  s.prepare_command = <<-CMD
    ./prepare.sh 3.0.0 34bc6cc39c073ab0b03cad53762cda6c6e13ab6741e010fe5d87b89a6f495ece 6236f32f5462c97b2a66a59b5ba2c471b3658ce722d6b87b6ec30e20e15a6ea2
  CMD

  s.default_subspec = 'Full'

  # 'Full' subspec
  s.subspec 'Full' do |sub|
    sub.vendored_frameworks = "WultraActivationSpawn.xcframework"
    sub.dependency 'WultraDeviceFingerprint', '~> 1.4.0'
    sub.dependency 'WultraPowerAuthNetworking', '~> 1.3.0'
  end

  # 'Basic' subspec
  s.subspec 'Basic' do |sub|
    sub.vendored_frameworks = "WultraActivationSpawnBasic.xcframework"
    sub.dependency 'WultraDeviceFingerprint', '~> 1.4.0'
  end
end