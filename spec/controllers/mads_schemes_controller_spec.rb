require 'spec_helper'

describe MadsSchemesController do
  describe "Show" do
    before do
      @scheme_obj = MadsScheme.create(code: "test", name: "Test Scheme", externalAuthority: 'http://test.com/1')
    end
    it "should be successful" do 
      get :show, id: @scheme_obj.id
      response.should be_successful 
    end
  end
    
  describe "New" do
    it "should be successful" do 
      get :new
      response.should be_successful 
      assigns[:mads_scheme].should be_kind_of MadsScheme
    end
  end
    
  describe "Edit" do
    before do
      @scheme_obj = MadsScheme.create(code: "test", name: "Test Scheme", externalAuthority: 'http://example.com/1')
    end    
    it "should be successful" do 
      get :edit, id: @scheme_obj.id
      response.should be_successful 
      @newobj = assigns[:mads_scheme]
      @newobj.code.should == @scheme_obj.code
      @newobj.name.should == @scheme_obj.name
    end
  end
    
  describe "Create" do
    it "should be successful" do
      expect { 
        post :create, :mads_scheme => {code: "test", name: "Test Scheme", externalAuthority: 'http://example.com/1'}
      }.to change { MadsScheme.count }.by(1)
      response.should redirect_to assigns[:mads_scheme]
      assigns[:mads_scheme].should be_kind_of MadsScheme
    end
  end
    
  describe "Update" do
    before do
      @scheme_obj = MadsScheme.create(code: "test", name: "Test Scheme", externalAuthority: 'http://example.com/1')
    end
    it "should be successful" do
      put :update, :id => @scheme_obj.id, :mads_scheme => {code: ["test2"], name: ["Test Scheme 2"], externalAuthority: ['http://example.com/2']}
      response.should redirect_to mads_scheme_path @scheme_obj.id
      @newobj = assigns[:mads_scheme]
      @newobj.name.should == "Test Scheme 2"
      @newobj.code.should == "test2"
      @newobj.externalAuthority.to_s == "http://example.com/2"
    end
  end
end

