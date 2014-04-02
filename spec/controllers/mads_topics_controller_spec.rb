require 'spec_helper'

describe MadsTopicsController do
  describe "Show" do
    before do
      @topic_obj = MadsTopic.create(name: "Test Topic", elementList_attributes: [{ topicElement_attributes: [{elementValue:"Test Topic"}] }], externalAuthority: 'http://test.com/2', scheme:'http://library.ucsd.edu/ark:20775/bb9999999x')
    end
    it "should be successful" do 
      get :show, id: @topic_obj.id
      response.should be_successful 
    end
  end
    
  describe "New" do
    it "should be successful" do 
      get :new
      response.should be_successful 
      assigns[:mads_topic].should be_kind_of MadsTopic
    end
  end
    
  describe "Edit" do
    before do
      @topic_obj = MadsTopic.create(name: "Test Topic", elementList_attributes: [{ topicElement_attributes: [{elementValue:"Test Topic"}] }], externalAuthority: 'http://test.com/2', scheme:'http://library.ucsd.edu/ark:20775/bb1111111x')
    end    
    it "should be successful" do 
      get :edit, id: @topic_obj.id
      response.should be_successful 
      @newobj = assigns[:mads_topic]
      @newobj.name.should == @topic_obj.name
    end
  end
    
  describe "Create" do
    it "should be successful" do
      expect { 
        post :create, :mads_topic => {name: "Test Topic", elementList_attributes: [{ topicElement_attributes: [{elementValue:"Test Topic"}] }], externalAuthority: 'http://test.com/2', scheme:'http://library.ucsd.edu/ark:20775/bb1111111x'}
      }.to change { MadsTopic.count }.by(1)
      response.should redirect_to assigns[:mads_topic]
      assigns[:mads_topic].should be_kind_of MadsTopic
    end
  end
    
  describe "Update" do
    before do
      @topic_obj = MadsTopic.create(name: "Test Topic", elementList_attributes: [{ topicElement_attributes: [{elementValue:"Test Topic"}] }], externalAuthority: 'http://test.com/2', scheme:'http://library.ucsd.edu/ark:20775/bb1111111x')
    end
    it "should be successful" do
      put :update, :id => @topic_obj.id, :mads_topic => {name: ["Test Topic 2"], elementList_attributes: [{ topicElement_attributes: [{elementValue:"Test Topic 2"}] }], externalAuthority: ['http://example.com/2'], scheme:'http://library.ucsd.edu/ark:20775/bb1111111y'}
      response.should redirect_to mads_topic_path @topic_obj.id
      @newobj = assigns[:mads_topic]
      @newobj.name.should == "Test Topic 2"
      @newobj.externalAuthority.to_s == "http://example.com/2"
      @newobj.scheme.to_s == "http://library.ucsd.edu/ark:20775/bb1111111y"
    end
  end
end
