require 'xcodeproj'

module Stanwood

  class ProjectManipulator
    attr_reader :configurator, :xcodeproj_path, :xcodeproj_renamed_path, :platform, :string_replacements, :project_key, :organisation

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @xcodeproj_path = options.fetch(:xcodeproj_path)
      @xcodeproj_renamed_path = options.fetch(:xcodeproj_renamed_path)
      @configurator = options.fetch(:configurator)
      @platform = options.fetch(:platform)
      @project_key = options.fetch(:project_key)
      @organisation = options.fetch(:organisation)
    end

    def run
      @string_replacements = {
        "PROJECT_OWNER" => @configurator.user_name,
        "TODAYS_DATE" => @configurator.date,
        "TODAYS_YEAR" => @configurator.year,
        "PROJECT" => @configurator.project_name,
        "KEY" => "#{@project_key}".downcase,
        "ORGANISATION" => "#{@organisation}",
        "Company Limited" => "#{@organisation}",
        "RUNSCRIPT_PRJ_PLACEHOLDER" => "PROJECT_NAME",
        "BUNDLE-ID" => "#{@organisation}".downcase.split(' ').first
      }

      puts "Replace internal project settings for: #{@project_key}"
      replace_internal_project_settings

      @project = Xcodeproj::Project.open(@xcodeproj_path)
      @project.save

      rename_files
      rename_project_folder

    end

    def project_folder
      File.dirname @xcodeproj_path
    end

    def project_renamed_folder
      File.dirname @xcodeproj_renamed_path
    end

    def rename_files
      # shared schemes have project specific names
      scheme_path = project_folder + "/PROJECT.xcodeproj/xcshareddata/xcschemes/"
      File.rename(scheme_path + "PROJECT.xcscheme", scheme_path +  @configurator.project_name + ".xcscheme")

      # rename xcproject
      File.rename(project_folder + "/PROJECT.xcodeproj", project_folder + "/" +  @configurator.project_name + ".xcodeproj")
    end

    def rename_project_folder

      puts "\n\nChecking if " + project_folder + "/PROJECT folder exists...\n"
      if Dir.exist? project_folder + "/PROJECT"

        puts "Renaming it to: " + project_folder + "/" + @configurator.project_name + "..."
        File.rename(project_folder + "/PROJECT", project_folder + "/" + @configurator.project_name)

        puts "Renaming root folder to: " + project_renamed_folder
        File.rename(project_folder, project_renamed_folder)
      end
    end

    def replace_internal_project_settings
      Dir.glob(project_folder + "/**/**/**/**").each do |name|
        next if Dir.exists? name
        text = File.read(name)

        for find, replace in @string_replacements
            text = text.gsub(find, replace)
        end

        File.open(name, "w") { |file| file.puts text }
      end
    end
  end
end
