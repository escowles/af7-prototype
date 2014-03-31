class MadsBase < ActiveFedora::Rdf::Resource
  property :name, predicate: MADS.authoritativeLabel
  property :externalAuthority, predicate: MADS.hasExactExternalAuthority
  property :scheme, predicate: MADS.isMemberOfMADSScheme, class_name: "MadsScheme"
  accepts_nested_attributes_for :scheme
end
