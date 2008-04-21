module RedHillConsulting
  class Simian
    EXECUTABLE = "java -jar #{Dir[File.join(File.dirname(__FILE__), '..', 'bin', 'simian*.jar')].first}".freeze

    def initialize(basedir = RAILS_ROOT)
      @basedir = basedir
      @includes = []
    end

    def includes(pattern)
      @includes << pattern
    end
    
    def options
      "-formatter=yaml"
    end
    
    def execute
      puts "#{EXECUTABLE} #{options} #{@includes.map { |pattern| "-includes=#{File.join(@basedir, pattern)}" } * ' '}"
      system("#{EXECUTABLE} #{options} #{@includes.map { |pattern| "-includes=#{File.join(@basedir, pattern)}" } * ' '}")
    end
  end
end
