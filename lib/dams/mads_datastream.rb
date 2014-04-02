module Dams
  # This class contains the basic properties common to virtually all MADS
  # classes: authoritativeLabel, isMemberOfMADSScheme, and
  # hasExactExternalAuthority.  Extend this class and add the RDF type
  # declaration and componentList/elementList required.
  #   resource_class.configure type: MADS.Topic
  #   property :elementList, predicate: MADS.elementList, :class_name => "MadsElementList"
  #   accepts_nested_attributes_for :elementList, :topicElement
  #   delegate :topicElement_attributes=, to: :elementList
  #   alias_method :topicElement, :elementList
  class MadsDatastream < ActiveFedora::RdfxmlRDFDatastream
    include Dams::ModelMethods

    resource_class.configure base_uri: "http://library.ucsd.edu/ark:/20775/"
    property :name, predicate: MADS.authoritativeLabel
    property :scheme, predicate: MADS.isMemberOfMADSScheme
    property :externalAuthority, predicate: MADS.hasExactExternalAuthority

    before_save do
      linkify( MADS.hasExactExternalAuthority, externalAuthority )
      linkify( MADS.isMemberOfMADSScheme, scheme )
    end

    def to_solr(solr_doc = Hash.new)
      Solrizer.insert_field(solr_doc,"name", name)
      if !externalAuthority.first.nil?
        Solrizer.insert_field(solr_doc,"externalAuthority", externalAuthority.first.rdf_subject.to_s)
      end
      if !scheme.first.nil?
        Solrizer.insert_field(solr_doc,"scheme", scheme.first.rdf_subject.to_s)
      end
      solr_doc
    end

  end
end
