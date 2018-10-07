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
      add_pods
      Stanwood::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/swift/PROJECT/PROJECT.xcodeproj",
        :xcodeproj_renamed_path => "templates/swift/" + @configurator.pod_name + "/PROJECT.xcodeproj",
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
      configurator.add_pod_to_podfile "'Firebase'"

      add_moya = configurator.ask_with_answers("Would you like to add Moya", ["Yes", "No"]).to_sym
      case add_moya
        when :yes
          configurator.add_pod_to_podfile "'Moya'"
      end

      add_image_cache = configurator.ask_with_answers("Would you like to add SDWebImage || Kingficher", ["SDWebImage", "Kingficher"]).to_sym
      case add_image_cache
      when :SDWebImage
        configurator.add_pod_to_podfile "'Firebase'"
      when :Kingficher
        configurator.add_pod_to_podfile "'Kingficher'"
      end
    end
  end
end
