require "http"

module EdoolsSdk
  # EdoolsBase class
  class EdoolsBase
    # Parse object to Hash
    def to_h
      hash = {}
      instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
      hash
    end
  end
end