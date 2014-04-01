class MadsTopicDatastream < ActiveFedora::RdfxmlRDFDatastream

  resource_class.configure type: MADS.Topic
  resource_class.configure base_uri: "http://library.ucsd.edu/ark:/20775/"

  property :name, predicate: MADS.authoritativeLabel
  property :externalAuthority, predicate: MADS.hasExactExternalAuthority
  property :elementList, predicate: MADS.elementList, :class_name => "MadsElementList"
  property :scheme, predicate: MADS.isMemberOfMADSScheme, :class_name => "MadsScheme"
  accepts_nested_attributes_for :elementList, :scheme, :topicElement
  delegate :topicElement_attributes=, to: :elementList
  alias_method :topicElement, :elementList

  def serialize
    if externalAuthority.first != ''
      s = graph.first( [rdf_subject,MADS.hasExactExternalAuthority,nil] )
      if !s.nil? && s.object.literal?
        @authority_uri = s.object.to_s
        graph.update( [rdf_subject, MADS.hasExactExternalAuthority, RDF::Resource.new(s.object)] )
      end
    else
      @authority_uri = nil
    end
    super
  end

  #def to_solr(solr_doc = Hash.new)
  #end
end
