class MADS < RDF::Vocabulary("http://www.loc.gov/mads/rdf/v1#")
  # MADS classes
  property :ComplexSubject
  property :Temporal
  property :Topic
  property :MADSScheme
 
  # MADS elements
  property :isMemberOfMADSScheme
  property :hasExactExternalAuthority
 
  # elementList and elementList values
  property :componentList
  property :elementList
  property :elementValue
  property :TemporalElement
  property :TopicElement
end
