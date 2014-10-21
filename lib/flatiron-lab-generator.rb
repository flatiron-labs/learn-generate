require_relative '../config/environment.rb'

module FlatironLabGenerator
  class TemplateMaker
    include TemplateHelper 
    include GemfileHelper

    TEMPLATES = [
      "fundamental-ruby",
      "command-line",
      "SQL",
      "activerecord",
      "rake",
      "erb-static-site",
      "rack",
      "sinatra-classic",
      "sinatra-mvc",
      "js",
      "front-end"
    ]

    attr_reader :template_type, :lab_name, :git

    def initialize(template_type, lab_name, git)
      @template_type = template_type
      @lab_name = lab_name
      @git = git
    end

    def self.run(template_type, lab_name, git)
      new(template_type, lab_name, git).create
    end

    def create
      copy
      name_lab
      FileUtils.cd("#{lab_name}") do
        touch_spec unless template_type == "js" || template_type == "sinatra-mvc" || template_type == "front-end"
        git_init if !git.nil?
        bundle_init unless template_type == "js" || template_type == "front-end"
        edit_readme
        fundamental_helper if template_type == "fundamental-ruby"
        command_line_helper if template_type == "command-line"
        sql_helper if template_type == "SQL"
        rake_helper if template_type == "rake"
        sinatra_mvc_helper if template_type == "sinatra-mvc"
        sinatra_classic_helper if template_type == "sinatra-classic"
        js_helper if template_type == "js"
        fe_helper if template_type == "front-end"
      end
      success_message
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

    def formatted_lab_name
      lab_name.gsub('-', '_')
    end

    def bundle_init
      `bundle init`
    end

    def touch_spec
      FileUtils.cd("spec/") do
        `touch #{formatted_lab_name}_spec.rb`
      end
    end

    def change_filename(path, filename, extension)
      FileUtils.cd(path) do
        File.rename(filename, "#{formatted_lab_name}.#{extension}")
      end
    end

    def edit_file(file, text)
      new_rr = IO.read(file) % { file_name: text }
      File.open(file, 'w') { |f| f.write(new_rr) }
    end

    def success_message
      puts "\n#{formatted_name} Lab successfully created in #{FileUtils.pwd}\n"
      FileUtils.cd("#{lab_name}") do
        puts "#{`tree`}"
      end
    end
  end
end
