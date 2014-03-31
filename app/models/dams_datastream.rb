class DamsDatastream < ActiveFedora::RdfxmlRDFDatastream
  property :complexSubject, predicate: DAMS.complexSubject, class_name: "MadsComplexSubject"
  property :scheme, predicate: MADS.isMemberOfMADSScheme, class_name: "MadsScheme"
  property :temporal, predicate: DAMS.temporal, class_name: "MadsTemporal"
  property :topic, predicate: DAMS.topic, class_name: "MadsTopic"
  accepts_nested_attributes_for :complexSubject, :scheme, :temporal, :topic
end
