class MadsScheme < ActiveFedora::Rdf::Resource
  configure type: MADS.MADSScheme
  property :name, predicate: RDF::RDFS.label
  property :code, predicate: DAMS.code
  property :externalAuthority, predicate: MADS.hasExactExternalAuthority
end
