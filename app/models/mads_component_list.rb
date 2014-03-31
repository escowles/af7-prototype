class MadsComponentList < ActiveFedora::Rdf::List
  configure type: MADS.componentList
  property :temporal, predicate: MADS.Temporal, class_name: "MadsTemporal"
  property :topic, predicate: MADS.Topic, class_name: "MadsTopic"
  accepts_nested_attributes_for :temporal, :topic
end
