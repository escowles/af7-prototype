class MadsTopicDatastream < Dams::MadsDatastream

  resource_class.configure type: MADS.Topic

  property :elementList, predicate: MADS.elementList, :class_name => "MadsElementList"
  accepts_nested_attributes_for :elementList, :topicElement
  delegate :topicElement_attributes=, to: :elementList
  alias_method :topicElement, :elementList

end
