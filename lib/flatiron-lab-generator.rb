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
          change_rr('spec/spec_helper.rb')
        end
        if template_type == "command-line-app-lab-template"
          change_filename('file.rb', 'rb')
          change_rr("bin/runner.rb")
          change_rr("spec/spec_helper.rb")
          change_rr("lib/#{lab_name}.rb")
          FileUtils.mv("lib/lab-name", "lib/#{lab_name}")
        end
        if template_type == "SQL-lab-template"
          change_filename('sample.sql', 'sql')
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

    def change_rr(file)
      new_rr = IO.read(file) % { file_name: lab_name }
      File.open(file, 'w') { |f| f.write(new_rr) }
    end
  end

  #TODO: include in this class
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
