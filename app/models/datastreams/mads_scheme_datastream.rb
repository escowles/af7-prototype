class MadsSchemeDatastream < ActiveFedora::RdfxmlRDFDatastream
  include Dams::ModelMethods

  resource_class.configure type: MADS.MADSScheme
  resource_class.configure base_uri: "http://library.ucsd.edu/ark:/20775/"

  property :name, predicate: RDF::RDFS.label
  property :code, predicate: DAMS.code
  property :externalAuthority, predicate: MADS.hasExactExternalAuthority

  before_save do
    linkify( MADS.hasExactExternalAuthority, externalAuthority )
  end

  def to_solr(solr_doc = Hash.new)
    Solrizer.insert_field(solr_doc,"name",name)
    Solrizer.insert_field(solr_doc,"code",code)
    if !externalAuthority.first.nil?
      Solrizer.insert_field(solr_doc,"externalAuthority", externalAuthority.first.rdf_subject.to_s)
    end
  end
end
