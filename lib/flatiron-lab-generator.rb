require_relative '../config/environment.rb'

module FlatironLabGenerator
  class TemplateMaker   
    TEMPLATES = [
      "procedural-ruby-lab-template",
      "command-line-app-lab-template",
      "SQL-lab-template",
      "activerecord-template",
      "rake-lab-template",
      "erb-static-site-lab-template",
      "rack-lab-template",
      "sinatra-no-db-lab-template ",
      "sinatra-lab-template"
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
        if template_type == "procedural-ruby-lab-template"
          change_filename
          change_spec_helper
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

    #for procedural; TODO: make module
    def change_filename
      FileUtils.cd('lib/') do
        File.rename('file.rb', "#{lab_name}.rb")
      end
    end

    def change_spec_helper
      new_rr = IO.read('spec/spec_helper.rb') % { file_name: lab_name }
      File.open('spec/spec_helper.rb', 'w') { |f| f.write(new_rr) }
    end
  end

  class FileFinder
    def self.location_to_dir(dir_name)
      new.location_to_dir(dir_name)
    end
   
    def location_to_dir(dir_name)
      File.join(File.dirname(File.expand_path(__FILE__)), "#{dir_name}")
    end
   
    def self.location_to_file(file_name)
      new.location_to_file(file_name)
    end
   
    def location_to_file(file_name)
      File.join(File.dirname(File.expand_path(__FILE__)))
    end
  end
end
