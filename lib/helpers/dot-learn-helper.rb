module DotLearnHelper
  def build_dot_learn
    File.open('.learn', 'a') do |f|
      f << "languages:
tags:"
    end
  end
end
