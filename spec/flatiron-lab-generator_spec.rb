require "spec_helper"

describe FlatironLabGenerator::TemplateMaker do
  let(:lab_generator_object) {FlatironLabGenerator::TemplateMaker.new("fundamental-ruby","test_lab","git_repo")}
  describe "#git_init" do
    it "initializes a new local git repo" do
      expect(lab_generator_object.git_init).to eq("Reinitialized existing Git repository in #{Dir.pwd}/.git/\n")
    end
  end

  describe "::run" do
    let(:lab_name) {"Test Lab"}
    it "creates the lab with expected name and returns nil" do
      expect(FlatironLabGenerator::TemplateMaker.run("fundamental-ruby",lab_name, "git repo")).to be_nil 
      # Write another expectation to make sure the lab is actually created
      FileUtils.rm_rf(lab_name)
    end
  end
end