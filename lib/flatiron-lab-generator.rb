require_relative '../config/environment.rb'

module FlatironLabGenerator
  class TemplateMaker
    include TemplateHelper 
    include GemfileHelper

    TEMPLATES = [
      "procedural-ruby",
      "command-line",
      "SQL",
      "activerecord",
      "rake",
      "erb-static-site",
      "rack",
      "sinatra-classic",
      "sinatra-mvc",
      "js"
    ]

    attr_reader :template_type, :lab_name

    def initialize(template_type, lab_name)
      @template_type = template_type
      @lab_name = lab_name
    end

    def self.run(template_type, lab_name)
      new(template_type, lab_name).create
    end

    def create
      copy
      name_lab
      FileUtils.cd("#{lab_name}") do
        git_init
        bundle_init
        edit_readme
        if template_type == "procedural-ruby"
          procedural_helper
        end
        if template_type == "command-line"
          command_line_helper
        end
        if template_type == "SQL"
          sql_helper
        end
        if template_type == "rake"
          rake_helper
        end
        if template_type == "sinatra-mvc"
          sinatra_mvc_helper
        end
        if template_type == "sinatra-classic"
          sinatra_classic_helper
        end
      end
    end

    def copy
      FileUtils.cp_r(FileFinder.location_to_dir("templates/#{template_type}"), FileUtils.pwd)
    end

    def name_lab
      FileUtils.mv(template_type, lab_name)
    end

    def git_init
      `git init`
    end

    def edit_readme
      File.open("README.md", 'a') do |f|
        f << "\n# #{formatted_name}"
      end
    end

    def formatted_name
      lab_name.gsub('-', ' ').split.map(&:capitalize).join(' ')
    end

    def bundle_init
      `bundle init`
    end

    def change_filename(filename, extension)
      FileUtils.cd('lib/') do
        File.rename(filename, "#{lab_name}.#{extension}")
      end
    end

    def edit_file(file)
      new_rr = IO.read(file) % { file_name: lab_name }
      File.open(file, 'w') { |f| f.write(new_rr) }
    end
  end
end
