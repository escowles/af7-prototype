class MadsTopic < ActiveFedora::Base
  has_metadata :name => "damsMetadata", :type => MadsTopicDatastream
  has_attributes :name, :externalAuthority, :elementList, :scheme, datastream: 'damsMetadata', multiple: false
  delegate :elementList_attributes=, to: :damsMetadata
  delegate :topicElement_attributes=, to: :damsMetadata
end
