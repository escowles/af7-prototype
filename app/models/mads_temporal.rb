class MadsTemporal < ActiveFedora::Base
  has_metadata :name => "damsMetadata", :type => MadsTemporalDatastream
  has_attributes :name, :externalAuthority, :elementList, :scheme, datastream: 'damsMetadata', multiple: false
  delegate :elementList_attributes=, to: :damsMetadata
  delegate :temporalElement_attributes=, to: :damsMetadata
end
