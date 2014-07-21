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
      new(template_type, lab_name).parse(template_type)
    end

    def parse(template_type)
      #given the template type, make the file
      #then
      name_lab
      #calls methods
      git_init
      bundle_init
      edit_readme
      if template_type == "procedural-ruby-lab-template"
        change_filename
        change_spec_helper
      end
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

    #for procedural
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
end
