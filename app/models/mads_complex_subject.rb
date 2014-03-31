class MadsComplexSubject < MadsBase
  configure type: MADS.ComplexSubject
  property :componentList, predicate: MADS.componentList, class_name: "MadsComponentList"
  accepts_nested_attributes_for :componentList
end
