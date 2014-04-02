require 'spec_helper'

describe MadsComplexSubject do
  it "should generate RDF" do 
    scheme_params = {
      scheme_attributes: [{
        id: 'http://library.ucsd.edu/ark:20775/bb1111111x',
        name: 'Library of Congress Subject Headings',
        code: 'lcsh',
        externalAuthority: RDF::Resource.new('http://id.loc.gov/vocabulary/subjects')
      }]
    }
    topic_params = {
      topic_attributes: [{
        id: 'http://library.ucsd.edu/ark:20775/bb2222222x',
        name: 'Civilization, Modern',
        externalAuthority: RDF::Resource.new('http://id.loc.gov/authorities/subjects/sh85026469'),
        elementList_attributes: [
          { topicElement_attributes: [{elementValue:"Civilization, Modern"}] }
        ],
        scheme_attributes: scheme_params[:scheme_attributes]
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
    complex_subject_params = {
      complexSubject_attributes: [{
        id: 'http://library.ucsd.edu/ark:20775/bb4444444x',
        name: 'Civilization, Modern--20th century',
        externalAuthority: RDF::Resource.new('http://id.loc.gov/authorities/subjects/sh85026473'),
        componentList_attributes: [{
          topic_attributes: topic_params[:topic_attributes],
          temporal_attributes: temporal_params[:temporal_attributes]
        }],
        scheme_attributes: scheme_params[:scheme_attributes]
      }]
    }
    subject = DamsRecord.new()
    subject.damsMetadata.attributes = complex_subject_params
    xml =<<END
<?xml version='1.0' encoding='utf-8' ?>
<rdf:RDF xmlns:mads='http://www.loc.gov/mads/rdf/v1#'
         xmlns:dams='http://library.ucsd.edu/ontology/dams#'
         xmlns:rdf='http://www.w3.org/1999/02/22-rdf-syntax-ns#'
         xmlns:rdfs='http://www.w3.org/2000/01/rdf-schema#'>
  <mads:ComplexSubject rdf:about='http://library.ucsd.edu/ark:20775/bb4444444x'>
    <mads:authoritativeLabel>Civilization, Modern--20th century</mads:authoritativeLabel>
    <mads:componentList rdf:parseType='Collection'>
      <mads:Topic rdf:nodeID='g70281371499280'>
        <mads:authoritativeLabel>Civilization, Modern</mads:authoritativeLabel>
        <mads:elementList rdf:parseType='Collection'>
          <mads:TopicElement rdf:nodeID='g70281371587440'>
            <mads:elementValue>Civilization, Modern</mads:elementValue>
          </mads:TopicElement>
        </mads:elementList>
        <mads:hasExactExternalAuthority rdf:resource='http://id.loc.gov/authorities/subjects/sh85026469' />
        <mads:isMemberOfMADSScheme>
          <mads:MADSScheme rdf:about='http://library.ucsd.edu/ark:20775/bb1111111x'>
            <rdfs:label>Library of Congress Subject Headings</rdfs:label>
            <dams:code>lcsh</dams:code>
            <mads:hasExactExternalAuthority rdf:resource='http://id.loc.gov/vocabulary/subjects' />
          </mads:MADSScheme>
        </mads:isMemberOfMADSScheme>
      </mads:Topic>
      <mads:Temporal rdf:nodeID='g70281371826020'>
        <mads:authoritativeLabel>20th century</mads:authoritativeLabel>
        <mads:elementList rdf:parseType='Collection'>
          <mads:TemporalElement rdf:nodeID='g70281371860940'>
            <mads:elementValue>20th century</mads:elementValue>
          </mads:TemporalElement>
        </mads:elementList>
        <mads:hasExactExternalAuthority rdf:resource='http://id.loc.gov/authorities/subjects/sh85139020' />
        <mads:isMemberOfMADSScheme rdf:resource='http://library.ucsd.edu/ark:20775/bb1111111x' />
      </mads:Temporal>
    </mads:componentList>
    <mads:hasExactExternalAuthority rdf:resource='http://id.loc.gov/authorities/subjects/sh85026473' />
    <mads:isMemberOfMADSScheme rdf:resource='http://library.ucsd.edu/ark:20775/bb1111111x' />
  </mads:ComplexSubject>
  
  <rdf:Description>
    <dams:complexSubject rdf:resource='http://library.ucsd.edu/ark:20775/bb4444444x' />
  </rdf:Description>
</rdf:RDF>
END
    subject.damsMetadata.content.should be_equivalent_to(xml).ignoring_attr_values
    # not a perfect solution (since there are some important attr values, but otherwise nodeID
    # makes this fail

    s = subject.complexSubject
    s.rdf_subject.should == "http://library.ucsd.edu/ark:20775/bb4444444x"
  end
end
