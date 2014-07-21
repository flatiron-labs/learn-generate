module 
  def procedural_helper
    change_filename
    edit_file('spec/spec_helper.rb')
  end

  def command_line_helper
    change_filename('file.rb', 'rb')
    edit_file("bin/runner.rb")
    edit_file("spec/spec_helper.rb")
    edit_file("lib/#{lab_name}.rb")
    FileUtils.mv("lib/lab-name", "lib/#{lab_name}")
  end

  def sql_helper
    change_filename('sample.sql', 'sql')
    edit_file("bin/sql_runner.rb")
  end
end