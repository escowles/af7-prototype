require 'vocabulary/dams_vocabulary'
require 'vocabulary/mads_vocabulary'
module RDF
  # This enables RDF to respond_to? :value
  def self.value
    self[:value]
  end
end

