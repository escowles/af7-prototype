require 'spec_helper'

describe MadsScheme do
  it "should generate RDF" do
    scheme_params = {
      scheme_attributes: [{
        id: 'http://library.ucsd.edu/ark:20775/bb1111111x',
        name: 'Library of Congress Subject Headings',
        code: 'lcsh',
        externalAuthority: RDF::Resource.new('http://id.loc.gov/vocabulary/subjects')
      }]
    }
    scheme = DamsRecord.new()
    scheme.damsMetadata.attributes = scheme_params
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
  <rdf:Description>
    <mads:isMemberOfMADSScheme rdf:resource='http://library.ucsd.edu/ark:20775/bb1111111x' />
  </rdf:Description>
</rdf:RDF>
END
    scheme.damsMetadata.content.should be_equivalent_to xml
  end
end
