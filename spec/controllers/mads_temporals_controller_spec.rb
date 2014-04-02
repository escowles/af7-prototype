require 'spec_helper'

describe MadsTemporalsController do
  describe "Show" do
    before do
      @temporal_obj = MadsTemporal.create(name: "Test Temporal", elementList_attributes: [{ temporalElement_attributes: [{elementValue:"Test Temporal"}] }], externalAuthority: 'http://test.com/2', scheme:'http://library.ucsd.edu/ark:20775/bb1111111x')
    end
    it "should be successful" do 
      get :show, id: @temporal_obj.id
      response.should be_successful 
    end
  end
    
  describe "New" do
    it "should be successful" do 
      get :new
      response.should be_successful 
      assigns[:mads_temporal].should be_kind_of MadsTemporal
    end
  end
    
  describe "Edit" do
    before do
      @temporal_obj = MadsTemporal.create(name: "Test Temporal", elementList_attributes: [{ temporalElement_attributes: [{elementValue:"Test Temporal"}] }], externalAuthority: 'http://test.com/2', scheme:'http://library.ucsd.edu/ark:20775/bb1111111x')
    end    
    it "should be successful" do 
      get :edit, id: @temporal_obj.id
      response.should be_successful 
      @newobj = assigns[:mads_temporal]
      @newobj.name.should == @temporal_obj.name
    end
  end
    
  describe "Create" do
    it "should be successful" do
      expect { 
        post :create, :mads_temporal => {name: "Test Temporal", elementList_attributes: [{ temporalElement_attributes: [{elementValue:"Test Temporal"}] }], externalAuthority: 'http://test.com/2', scheme:'http://library.ucsd.edu/ark:20775/bb1111111x'}
      }.to change { MadsTemporal.count }.by(1)
      response.should redirect_to assigns[:mads_temporal]
      assigns[:mads_temporal].should be_kind_of MadsTemporal
    end
  end
    
  describe "Update" do
    before do
      @temporal_obj = MadsTemporal.create(name: "Test Temporal", elementList_attributes: [{ temporalElement_attributes: [{elementValue:"Test Temporal"}] }], externalAuthority: 'http://test.com/2', scheme:'http://library.ucsd.edu/ark:20775/bb1111111x')
    end
    it "should be successful" do
      put :update, :id => @temporal_obj.id, :mads_temporal => {name: ["Test Temporal 2"], elementList_attributes: [{ temporalElement_attributes: [{elementValue:"Test Temporal 2"}] }], externalAuthority: ['http://example.com/2'], scheme:'http://library.ucsd.edu/ark:20775/bb1111111y'}
      response.should redirect_to mads_temporal_path @temporal_obj.id
      @newobj = assigns[:mads_temporal]
      @newobj.name.should == "Test Temporal 2"
      @newobj.externalAuthority.to_s == "http://example.com/2"
      @newobj.scheme.to_s == "http://library.ucsd.edu/ark:20775/bb1111111y"
    end
  end
end
