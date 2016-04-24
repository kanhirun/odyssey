require 'simplecov'

class CodeCoverage
  def self.start!
    SimpleCov.start :rails do
      # Returns non-zero exit code when coverage drops below 100:
      minimum_coverage 98.23

      add_filter 'lib/services'
    end
  end
end
