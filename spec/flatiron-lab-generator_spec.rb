require "spec_helper"

describe FlatironLabGenerator::TemplateMaker do
  let(:lab_generator_object) {FlatironLabGenerator::TemplateMaker.new("fundamental-ruby","test_lab","git_repo")}
  describe "#git_init" do
    it "initializes a new local git repo" do
      lab_generator_object.git_init
      expect(system('git rev-parse')).to eq(true)
    end
  end

  describe "::run" do
    let(:lab_name) {"test_lab"}
    it "creates a lab template with expected name and returns nil" do
      expect(FlatironLabGenerator::TemplateMaker.run("fundamental-ruby",lab_name, "git repo")).to be_nil 
      expect(File.directory?(lab_name)).to eq(true) 
      expect(`tree #{lab_name}`).to eq("test_lab\n├── Gemfile\n├── README.md\n├── lib\n│   └── test_lab.rb\n└── spec\n    ├── spec_helper.rb\n    └── test_lab_spec.rb\n\n2 directories, 5 files\n")
      FileUtils.rm_rf(lab_name)
    end

    it "creates a command-line lab template" do
      expect(FlatironLabGenerator::TemplateMaker.run("command-line",lab_name, "git repo")).to be_nil 
      expect(`tree #{lab_name}`).to eq("test_lab\n├── Gemfile\n├── README.md\n├── bin\n│   └── runner.rb\n├── lib\n│   ├── environment.rb\n│   └── test_lab\n│       └── cli.rb\n└── spec\n    ├── spec_helper.rb\n    └── test_lab_spec.rb\n\n4 directories, 7 files\n")
      FileUtils.rm_rf(lab_name)
    end 

    it "creates a SQL lab" do 
      expect(FlatironLabGenerator::TemplateMaker.run("sql",lab_name, "git repo")).to be_nil 
      expect(`tree #{lab_name}`).to eq("test_lab\n├── Gemfile\n├── README.md\n├── bin\n│   ├── environment.rb\n│   ├── run.rb\n│   └── sql_runner.rb\n├── lib\n│   └── sample.sql\n└── spec\n    ├── spec_helper.rb\n    └── test_lab_spec.rb\n\n3 directories, 8 files\n")
      FileUtils.rm_rf(lab_name)
    end

    it "creates an activerecord lab" do
      expect(FlatironLabGenerator::TemplateMaker.run("activerecord",lab_name, "git repo")).to be_nil 
      expect(`tree #{lab_name}`).to eq("test_lab\n├── Gemfile\n├── README.md\n├── Rakefile\n├── app\n│   └── models\n│       └── sample-class.rb\n├── config\n│   └── environment.rb\n├── db\n│   └── migrations\n├── lib\n│   └── support\n│       ├── connection_adapter.rb\n│       └── db_registry.rb\n└── spec\n    ├── spec_helper.rb\n    └── test_lab_spec.rb\n\n8 directories, 9 files\n")
      FileUtils.rm_rf(lab_name)
    end

    it "creates a rake lab" do
      expect(FlatironLabGenerator::TemplateMaker.run("rake",lab_name, "git repo")).to be_nil 
      expect(`tree #{lab_name}`).to eq("test_lab\n├── Gemfile\n├── README.md\n├── Rakefile\n├── bin\n│   └── console\n├── config\n│   └── environment.rb\n├── lib\n│   └── test_lab.rb\n└── spec\n    ├── rakefile_spec.rb\n    ├── spec_helper.rb\n    └── test_lab_spec.rb\n\n4 directories, 9 files\n")
      FileUtils.rm_rf(lab_name)
    end

    it "creates a erb-static-site lab" do
      expect(FlatironLabGenerator::TemplateMaker.run("erb-static-site",lab_name, "git repo")).to be_nil 
      expect(`tree #{lab_name}`).to eq("test_lab\n├── Gemfile\n├── README.md\n├── Rakefile\n├── bin\n│   └── console\n├── config\n│   └── environment.rb\n├── lib\n│   └── test_lab.rb\n└── spec\n    ├── rakefile_spec.rb\n    ├── spec_helper.rb\n    └── test_lab_spec.rb\n\n4 directories, 9 files\n")
      FileUtils.rm_rf(lab_name)
    end

    it "creates a rack lab" do
      expect(FlatironLabGenerator::TemplateMaker.run("rack",lab_name, "git repo")).to be_nil 
      expect(`tree #{lab_name}`).to eq("test_lab\n├── Gemfile\n├── README.md\n├── app\n│   ├── application.rb\n│   └── controllers\n│       └── erb_maker.rb\n├── config\n│   └── environment.rb\n├── config.ru\n├── lib\n│   └── templates\n│       └── my_cool_response.html.erb\n└── spec\n    ├── controllers\n    │   └── 01_server_port_spec.rb\n    ├── spec_helper.rb\n    ├── support\n    │   └── an_ok_request.rb\n    └── test_lab_spec.rb\n\n8 directories, 11 files\n")
      FileUtils.rm_rf(lab_name)
    end

    it "creates a sinatra-classic lab" do
      expect(FlatironLabGenerator::TemplateMaker.run("sinatra-classic",lab_name, "git repo")).to be_nil 
      expect(`tree #{lab_name}`).to eq("test_lab\n├── Gemfile\n├── README.md\n├── Rakefile\n├── app.rb\n├── config\n│   └── environment.rb\n├── config.ru\n├── models\n├── public\n│   ├── images\n│   ├── javascripts\n│   └── stylesheets\n├── spec\n│   ├── spec_helper.rb\n│   └── test_lab_spec.rb\n└── views\n\n8 directories, 8 files\n")
      FileUtils.rm_rf(lab_name)
    end

    it "creates a sinatra-mvc lab" do

    end
  end

  describe "#create" do
    it "does something" do
      expect(true).to eq(true)
    end
  end
end