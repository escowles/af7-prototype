require 'spec_helper'

describe "MadsTemporal" do
  it "should generate RDF" do
    @temporal_params = {
      name: '20th century',
      externalAuthority: RDF::Resource.new('http://id.loc.gov/authorities/subjects/sh85139020'),
      elementList_attributes: [{
          temporalElement_attributes: [{elementValue:"20th century"}]
      }],
      scheme: RDF::Resource.new('http://library.ucsd.edu/ark:20775/bb1111111x')
    }
    @temporal = MadsTemporal.new(pid: 'http://library.ucsd.edu/ark:20775/bb33333333x')
    @temporal.attributes = @temporal_params
    @temporal_xml =<<TEMPORAL_XML
<?xml version='1.0' encoding='utf-8' ?>
<rdf:RDF xmlns:mads='http://www.loc.gov/mads/rdf/v1#'
         xmlns:dams='http://library.ucsd.edu/ontology/dams#'
         xmlns:rdf='http://www.w3.org/1999/02/22-rdf-syntax-ns#'
         xmlns:rdfs='http://www.w3.org/2000/01/rdf-schema#'>
  <mads:Temporal rdf:about='http://library.ucsd.edu/ark:20775/bb33333333x'>
    <mads:authoritativeLabel>20th century</mads:authoritativeLabel>
    <mads:elementList rdf:parseType='Collection'>
      <mads:TemporalElement rdf:nodeID='g70258460074420'>
        <mads:elementValue>20th century</mads:elementValue>
      </mads:TemporalElement>
    </mads:elementList>
    <mads:hasExactExternalAuthority rdf:resource='http://id.loc.gov/authorities/subjects/sh85139020' />
    <mads:isMemberOfMADSScheme rdf:resource='http://library.ucsd.edu/ark:20775/bb1111111x' />
  </mads:Temporal>
</rdf:RDF>
TEMPORAL_XML
    @temporal.damsMetadata.content.should be_equivalent_to(@temporal_xml).ignoring_attr_values
    # not a perfect solution (since there are some important attr values, but otherwise nodeID
    # makes this fail
  end
end
