module Stanwood

  class ConfigureSwift
    attr_reader :configurator

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform
      keep_demo = "Yes"
      # configurator.set_test_framework "xctest", "swift", "swift"

      configurator.add_pod_to_podfile "StanwoodAnalytics"
      configurator.add_pod_to_podfile "StanwoodCore"
      configurator.add_pod_to_podfile "StanwoodDebugger, configurations => ['Debug']"
      configurator.add_pod_to_podfile "StanwoodDialog"
      configurator.add_pod_to_podfile "Firebase"

      Stanwood::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/swift/Example/PROJECT.xcodeproj",
        :platform => :ios,
        :remove_demo_project => (keep_demo == :no),
        :prefix => ""
      }).run

      `mv ./templates/swift/* ./`

      # There has to be a single file in the Classes dir
      # or a framework won't be created
      `touch Pod/Classes/ReplaceMe.swift`

      # The Podspec should be 8.0 instead of 7.0
      text = File.read("NAME.podspec")
      text.gsub!("7.0", "8.0")
      File.open("NAME.podspec", "w") { |file| file.puts text }

      # remove podspec for osx
      `rm ./NAME-osx.podspec`
    end
  end

end
