require 'spec_helper'

describe MadsTopic do
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
    topic = DamsRecord.new()
    topic.damsMetadata.attributes = topic_params
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
  <mads:Topic rdf:about='http://library.ucsd.edu/ark:20775/bb2222222x'>
    <mads:authoritativeLabel>Civilization, Modern</mads:authoritativeLabel>
    <mads:elementList rdf:parseType='Collection'>
      <mads:TopicElement rdf:nodeID='g70258460074420'>
        <mads:elementValue>Civilization, Modern</mads:elementValue>
      </mads:TopicElement>
    </mads:elementList>
    <mads:hasExactExternalAuthority rdf:resource='http://id.loc.gov/authorities/subjects/sh85026469' />
    <mads:isMemberOfMADSScheme rdf:resource='http://library.ucsd.edu/ark:20775/bb1111111x' />
  </mads:Topic>
  <rdf:Description>
    <dams:topic rdf:resource='http://library.ucsd.edu/ark:20775/bb2222222x' />
  </rdf:Description>
</rdf:RDF>
END
    topic.damsMetadata.content.should be_equivalent_to(xml).ignoring_attr_values
    # not a perfect solution (since there are some important attr values, but otherwise nodeID
    # makes this fail
  end
end
