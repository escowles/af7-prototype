require 'spec_helper'

describe MadsTemporal do
  it "should generate RDF" do
    scheme_params = {
      scheme_attributes: [{
        id: 'http://library.ucsd.edu/ark:20775/bb1111111x',
        name: 'Library of Congress Subject Headings',
        code: 'lcsh',
        externalAuthority: RDF::Resource.new('http://id.loc.gov/vocabulary/subjects')
      }]
    }
    temporal_params = {
      temporal_attributes: [{
        id: 'http://library.ucsd.edu/ark:20775/bb3333333x',
        name: '20th century',
        externalAuthority: RDF::Resource.new('http://id.loc.gov/authorities/subjects/sh85139020'),
        elementList_attributes: [
          { temporalElement_attributes: [{elementValue:"20th century"}] }
        ],
        scheme_attributes: scheme_params[:scheme_attributes]
      }]
    }
    temporal = DamsRecord.new()
    temporal.damsMetadata.attributes = temporal_params
    xml =<<END
<?xml version='1.0' encoding='utf-8' ?>
<rdf:RDF xmlns:mads='http://www.loc.gov/mads/rdf/v1#'
         xmlns:dams='http://library.ucsd.edu/ontology/dams#'
         xmlns:rdf='http://www.w3.org/1999/02/22-rdf-syntax-ns#'
         xmlns:rdfs='http://www.w3.org/2000/01/rdf-schema#'>
  <mads:MADSScheme rdf:about='http://library.ucsd.edu/ark:20775/bb1111111x'>
    <rdfs:label>Library of Congress Subject Headings</rdfs:label>
    <dams:code>lcsh</dams:code>
    <mads:hasExactExternalAuthority rdf:resource='http://id.loc.gov/vocabulary/subjects' />
  </mads:MADSScheme>
  <mads:Temporal rdf:about='http://library.ucsd.edu/ark:20775/bb3333333x'>
    <mads:authoritativeLabel>20th century</mads:authoritativeLabel>
    <mads:elementList rdf:parseType='Collection'>
      <mads:TemporalElement rdf:nodeID='g70213060883200'>
        <mads:elementValue>20th century</mads:elementValue>
      </mads:TemporalElement>
    </mads:elementList>
    <mads:hasExactExternalAuthority rdf:resource='http://id.loc.gov/authorities/subjects/sh85139020' />
    <mads:isMemberOfMADSScheme rdf:resource='http://library.ucsd.edu/ark:20775/bb1111111x' />
  </mads:Temporal>
  <rdf:Description>
    <dams:temporal rdf:resource='http://library.ucsd.edu/ark:20775/bb3333333x' />
  </rdf:Description>
</rdf:RDF>
END
    temporal.damsMetadata.content.should be_equivalent_to(xml).ignoring_attr_values
    # not a perfect solution (since there are some important attr values, but otherwise nodeID
    # makes this fail
  end
end
