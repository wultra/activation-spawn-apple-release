Pod::Spec.new do |s|
  s.cocoapods_version   = '>= 1.10'
  s.name                = "WultraActivationSpawn"
  s.version             = "3.2.1"
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
    ./prepare.sh 3.2.1 bc750bca44a05aaddc563ae2d8d6f92b38c9d993acf6bd374d74086d4a0f1a0b ec2f9c4f673b01847afbb7c88978c92ed237c2463d8e674425ebbcfde14e4184
  CMD

  s.default_subspec = 'Full'

  # 'Full' subspec
  s.subspec 'Full' do |sub|
    sub.vendored_frameworks = "WultraActivationSpawn.xcframework"
    sub.dependency 'WultraDeviceFingerprint', '~> 1.4.0'
    sub.dependency 'WultraPowerAuthNetworking', '~> 1.5.0'
  end

  # 'Basic' subspec
  s.subspec 'Basic' do |sub|
    sub.vendored_frameworks = "WultraActivationSpawnBasic.xcframework"
    sub.dependency 'WultraDeviceFingerprint', '~> 1.4.0'
  end
end