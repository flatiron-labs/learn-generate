TO TEST LOCALLY
1. `gem build flatiron-lab-generator.gemspec`
2. `gem install ./flatiron-lab-generator-0.0.12.gem` (whatever version)

TO BUILD

1. change version, add, commit, push
1. `rake build`
2. `gem inabox pkg/gem-version.gem`
