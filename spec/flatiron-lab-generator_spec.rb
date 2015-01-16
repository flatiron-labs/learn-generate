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
    it "creates the lab with expected name and returns nil" do
      expect(FlatironLabGenerator::TemplateMaker.run("fundamental-ruby",lab_name, "git repo")).to be_nil 
      expect(File.directory?(lab_name)).to eq(true) 
      expect(`tree #{lab_name}`).to eq("test_lab\n├── Gemfile\n├── README.md\n├── lib\n│   └── test_lab.rb\n└── spec\n    ├── spec_helper.rb\n    └── test_lab_spec.rb\n\n2 directories, 5 files\n")
      FileUtils.rm_rf(lab_name)
    end
  end

  
end