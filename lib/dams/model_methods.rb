module Dams
  module ModelMethods

    # @param predicate RDF predicate linking to value
    # @param val String value to convert into a URI
    # Look for URIs as Strings and convert them to URI objects
    def linkify( predicate, val )
      if !val.first.blank? && val.first.class == String
        s = graph.first( [rdf_subject,predicate,nil] )
        if !s.nil? && s.object.literal?
          graph.delete( s )
          graph.insert([rdf_subject, predicate, RDF::Resource.new(s.object)] )
        end
      end
    end

  end
end
