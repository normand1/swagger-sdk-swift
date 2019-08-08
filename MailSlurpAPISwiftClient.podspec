Pod::Spec.new do |s|
  s.name = 'MailSlurpAPISwiftClient'
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.version = '0.0.1'
  s.source = { :git => 'git@github.com:swagger-api/swagger-mustache.git', :tag => 'v1.0.0' }
  s.authors = 'MailSlurp'
  s.license = 'Proprietary'
  s.homepage = 'https://www.mailslurp.com'
  s.summary = 'Official MailSlurp API Client. Generated with Swagger Codegen'
  s.description = 'https://docs.mailslurp.com'
  s.documentation_url = 'https://docs.mailslurp.com'
  s.source_files = 'MailSlurpAPISwiftClient/Classes/**/*.swift'
  s.dependency 'Alamofire', '~> 3.5.1'
end
