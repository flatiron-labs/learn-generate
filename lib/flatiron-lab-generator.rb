require_relative '../config/environment.rb'

module FlatironLabGenerator
  class TemplateMaker
    attr_reader :template_type, :lab_name
    def initialize(template_type, lab_name)
      @template_type = template_type
      @lab_name = lab_name
    end

    def self.run(template_type, lab_name)
      new(template_type, lab_name).create
    end

    def create
      #parses template, making new one in pwd and provided lab name

      #calls methods
      git_init
      bundle_init
      edit_readme
      if template_type == "procedural-ruby-lab-template"
        change_filename
        change_spec_helper
      end
    end

    def git_init
      `git init`
    end

    def edit_readme
      File.open("README.md", 'a') do |f|
        f << "\n# #{lab_name}"
      end
    end

    def bundle_init
      `bundle init`
    end

    #for procedural
    def change_filename
      new_file_name
      FileUtils.cd('lib/') do
        File.rename('file.rb', "#{new_file_name}.rb")
      end
    end

    def new_file_name
      lab_name.gsub!(" ", "-")
    end

    def change_spec_helper
      new_rr = IO.read('spec/spec_helper.rb') % { :file_name => new_file_name }
      File.open('spec/spec_helper.rb', 'w') { |f| f.write(new_rr) }
    end

  end
end
