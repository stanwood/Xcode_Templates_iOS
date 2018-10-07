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

      add_pods

      # I might need this after
      # " + @configurator.pod_name + "

      Stanwood::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/swift/PROJECT/PROJECT.xcodeproj",
        :platform => :ios,
        :remove_demo_project => (keep_demo == :no),
        :prefix => ""
      }).run

      `mv ./templates/swift/* ./`
    end

    def add_pods
      configurator.add_pod_to_podfile "'StanwoodAnalytics'"
      configurator.add_pod_to_podfile "'StanwoodCore'"
      configurator.add_pod_to_podfile "'StanwoodDebugger', :configurations => ['Debug']"
      configurator.add_pod_to_podfile "'StanwoodDialog'"

      add_firebase = configurator.ask_with_answers("Would you like to add Firebase", ["Yes", "No"]).to_sym
      case add_firebase
        when :yes
          configurator.add_pod_to_podfile "'Firebase'"
      end
    end

  end

end
