Pod::Spec.new do |s|

    s.name         = 'CcExtensions'
    s.version      = '4.2.2'
    s.summary      = '扩展'
    s.homepage     = 'https://github.com/J-yezi/CcExtensions'
    s.license      = 'MIT'
    s.author       = { 'J-yezi' => 'yehao1020@gmail.com' }
    s.source       = { :git => 'https://github.com/J-yezi/CcExtensions.git', :tag => s.version }

    s.ios.deployment_target = '8.0'

    s.default_subspec = 'Core'

    s.subspec 'Core' do |ss|
        ss.source_files = 'Sources/Core/**/*.swift'
        ss.frameworks   = 'Foundation', 'UIKit'
    end

    s.subspec 'RxSwift' do |ss|
        ss.source_files = 'Sources/RxSwift/**/*.swift'
        ss.dependency 'CcExtensions/Core'
        ss.dependency 'RxSwift', '>=4.3.0'
        ss.dependency 'RxCocoa', '>=4.3.0'
        ss.frameworks   = 'Foundation', 'UIKit'
    end

end
