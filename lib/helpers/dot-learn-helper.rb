module DotLearnHelper
  def build_dot_learn
    File.open('.learn', 'a') do |f|
      f << "\nlanguages:
      tags:
      "
    end
  end
end
