desc "Check source code for duplication"
task :simian => ['simian:main', 'simian:test']

namespace :simian do
  desc "Check production files for duplication"
  task :main => :environment do
    simian = RedHillConsulting::Simian.new
    simian.includes('app/**/*.rb')
    simian.includes('components/**/*.rb')
    simian.includes('lib/**/*.rb')
    simian.includes('app/**/*.rhtml')
    simian.execute
  end

  desc "Check test files for duplication"
  task :test => :environment do
    simian = RedHillConsulting::Simian.new
    simian.includes('test/**/*.rb')
    simian.includes('spec/**/*.rb')
    simian.execute
  end
  
  desc "Check production and test files together for duplication"
  task :all => :environment do
    
  end
  
  def check(patterns)
    fail("") unless simian.execute
  end
end
