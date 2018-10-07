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
      configurator.add_pod_to_podfile "'ReachabilitySwift'"
      configurator.add_pod_to_podfile "'MBProgressHUD'"

      add_moya = configurator.ask_with_answers("Would you like to add Moya", ["Yes", "No"]).to_sym
      case add_moya
        when :yes
          configurator.add_pod_to_podfile "'Moya'"
      end



      add_rm_store = configurator.ask_with_answers("Would you like to add RMStore to handle IAP", ["Yes", "No"]).to_sym
      case add_rm_store
        when :yes
          configurator.add_pod_to_podfile "'RMStore'"
      end

      add_keyboard_manager = configurator.ask_with_answers("IQKeyboardManagerSwift allows you to prevent issues of the keyboard sliding up and cover UITextField/UITextView without needing you to enter any code and no additional setup required.\n\nWould you like to add IQKeyboardManagerSwift", ["Yes", "No"]).to_sym
      case add_keyboard_manager
        when :yes
          configurator.add_pod_to_podfile "'IQKeyboardManagerSwift'"
      end

      add_font_awesome = configurator.ask_with_answers("Would you like to add FontAwesome.swift", ["Yes", "No"]).to_sym
      case add_font_awesome
        when :yes
          configurator.add_pod_to_podfile "'FontAwesome.swift'"
      end

      add_image_cache = configurator.ask_with_answers("Would you like to add SDWebImage || Kingficher", ["SDWebImage", "Kingfisher"]).to_sym
      case add_image_cache
      when :SDWebImage
        configurator.add_pod_to_podfile "'SDWebImage'"
      when :Kingficher
        configurator.add_pod_to_podfile "'Kingfisher'"
      end
    end
  end
end
