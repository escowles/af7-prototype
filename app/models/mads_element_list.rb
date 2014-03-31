class MadsElementList < ActiveFedora::Rdf::List
  configure type: MADS.elementList
  property :temporalElement, predicate: MADS.TemporalElement, class_name: "MadsTemporalElement"
  property :topicElement, predicate: MADS.TopicElement, class_name: "MadsTopicElement"
  accepts_nested_attributes_for :temporalElement, :topicElement
end
