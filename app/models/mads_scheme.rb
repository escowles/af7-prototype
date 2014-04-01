class MadsScheme < ActiveFedora::Base
  has_metadata :name => "damsMetadata", :type => MadsSchemeDatastream
  has_attributes :name, :code, :externalAuthority, datastream: 'damsMetadata', multiple: false
end
