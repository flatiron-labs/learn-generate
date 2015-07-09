module LearnGenerate
  module Helpers
    module DotLearnHelper
      def build_dot_learn
        File.open('.learn', 'a') do |f|
          f.write("tags:\n  - tag1\nlanguages:  - language1\nresources: 0")
        end
      end
    end
  end
end
