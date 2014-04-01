class MadsSchemeDatastream < ActiveFedora::RdfxmlRDFDatastream

  resource_class.configure type: MADS.MADSScheme
  resource_class.configure base_uri: "http://library.ucsd.edu/ark:/20775/"

  property :name, predicate: RDF::RDFS.label
  property :code, predicate: DAMS.code
  property :externalAuthority, predicate: MADS.hasExactExternalAuthority

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

  def to_solr(solr_doc = Hash.new)
    Solrizer.insert_field(solr_doc,"name",name)
    Solrizer.insert_field(solr_doc,"code",code)
    if @authority_uri != nil
      Solrizer.insert_field(solr_doc,"externalAuthority",@authority_uri)
    end
  end
end
