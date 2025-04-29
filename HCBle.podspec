Pod::Spec.new do |s|
  # 변수 설정
  token = ENV['GIT_ACCESS_TOKEN']
  name = 'HCBle'
  version = '0.1.8'
  description = 'This is a ios BLE SDK'
  repo_url = 'https://github.com/hconnectdx/ios-bt-sdk'
  
  s.name             = name
  s.version          = version
  s.summary          = description
  
  s.description      = description
  s.homepage         = repo_url
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hconnectdx' => 'kmwdev@hconnect.co.kr' }
  
  # 🔥 보안 강화: URL에서 토큰 직접 사용 금지 → x-oauth-basic 방식 적용
  s.source           = { :git => "https://oauth2:#{token}@github.com/hconnectdx/ios-bt-sdk.git", :tag => version }
  
  s.ios.deployment_target = '10.0'
  s.source_files = 'HCBle/HCBleClasses/**/*'
end
