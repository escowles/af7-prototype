class MadsTemporalDatastream < Dams::MadsDatastream

  resource_class.configure type: MADS.Temporal

  property :elementList, predicate: MADS.elementList, :class_name => "MadsElementList"
  accepts_nested_attributes_for :elementList, :temporalElement
  delegate :temporalElement_attributes=, to: :elementList
  alias_method :temporalElement, :elementList

end
