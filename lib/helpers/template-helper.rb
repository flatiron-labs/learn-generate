module TemplateHelper
  def procedural_helper
    change_filename('lib/', 'file.rb', 'rb')
    edit_file('spec/spec_helper.rb')
  end

  def command_line_helper
    change_filename('lib/', 'file.rb', 'rb')
    edit_file("bin/runner.rb")
    edit_file("spec/spec_helper.rb")
    edit_file("lib/#{lab_name}.rb")
    FileUtils.mv("lib/lab-name", "lib/#{lab_name}")
  end

  def sql_helper
    change_filename('lib/', 'sample.sql', 'sql')
    edit_file("bin/sql_runner.rb")
  end

  def rake_helper
    change_filename('lib/', 'file.rb', 'rb')
    edit_file("config/environment.rb")
  end

  def sinatra_mvc_helper
    edit_mvc_gemfile
  end

  def sinatra_classic_helper
    edit_classic_gemfile
  end

  def js_helper
    change_filename('js/', 'file.js', 'js')
  end
end