Pod::Spec.new do |s|
  s.name = "SettingsViewController"
  s.version = "0.2.1"

  s.summary = "Add settings to your app with a few lines of code."
  s.homepage = "https://github.com/eugenebokhan/SettingsViewController"

  s.author = {
    "Eugene Bokhan" => "eugenebokhan@protonmail.com"
  }

  s.ios.deployment_target = "13.0"

  s.source = {
    :git => "https://github.com/eugenebokhan/SettingsViewController.git",
    :tag => "#{s.version}"
  }
  s.source_files = "Sources/**/*.{swift}"

  s.swift_version = "5.2"

  s.dependency "SnapKit"
  s.dependency "CustomHeightTransition"
end
