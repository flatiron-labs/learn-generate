require "spec_helper"

describe FlatironLabGenerator::TemplateMaker do
  let(:lab_generator_object) {FlatironLabGenerator::TemplateMaker.new("fundamental-ruby","test_lab","git_repo")}
  describe "#git_init" do
    it "initializes a new local git repo" do
      expect(lab_generator_object.git_init).to eq("Reinitialized existing Git repository in #{Dir.pwd}/.git/\n")
    end
  end
end