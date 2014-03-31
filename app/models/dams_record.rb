class DamsRecord < ActiveFedora::Base
  has_metadata :name=>"damsMetadata", :type=>DamsDatastream
  has_attributes :complexSubject, :scheme, :temporal, :topic, datastream: 'damsMetadata', multiple: false
end
