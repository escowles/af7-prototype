class MadsTopicDatastream < ActiveFedora::RdfxmlRDFDatastream
  include Dams::ModelMethods

  resource_class.configure type: MADS.Topic
  resource_class.configure base_uri: "http://library.ucsd.edu/ark:/20775/"

  property :name, predicate: MADS.authoritativeLabel
  property :elementList, predicate: MADS.elementList, :class_name => "MadsElementList"
  property :externalAuthority, predicate: MADS.hasExactExternalAuthority
  property :scheme, predicate: MADS.isMemberOfMADSScheme

  accepts_nested_attributes_for :elementList, :topicElement
  delegate :topicElement_attributes=, to: :elementList
  alias_method :topicElement, :elementList

  before_save do
    linkify( MADS.hasExactExternalAuthority, externalAuthority )
    linkify( MADS.isMemberOfMADSScheme, scheme )
  end

  def to_solr(solr_doc = Hash.new)
    Solrizer.insert_field(solr_doc,"name", name)
    if !externalAuthority.first.nil?
      Solrizer.insert_field(solr_doc,"externalAuthority", externalAuthority.first.rdf_subject.to_s)
    end
    solr_doc
  end

end
