Pod::Spec.new do |s|
  s.name = "SettingsViewController"
  s.version = "0.1.0"

  s.summary = "A lightweight ViewController with settings sliders"
  s.homepage = "https://github.com/eugenebokhan/SettingsViewController"

  s.author = {
    "Eugene Bokhan" => "eugenebokhan@protonmail.com"
  }

  s.ios.deployment_target = "12.3"

  s.source = {
    :git => "https://github.com/eugenebokhan/SettingsViewController.git",
    :tag => "#{s.version}"
  }
  s.source_files = "Sources/**/*.{swift}"

  s.swift_version = "5.1"

  s.dependency "SnapKit"
end
