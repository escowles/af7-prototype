class MadsSimpleType < MadsBase
  property :elementList, predicate: MADS.elementList, class_name: "MadsElementList"
  accepts_nested_attributes_for :elementList
end
