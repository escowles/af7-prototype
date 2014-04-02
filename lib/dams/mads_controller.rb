module Dams
  # This class provides the common machinery for working with MADS classes.
  class MadsController < ApplicationController
    include Blacklight::Catalog
    include Dams::ControllerMethods

    # solr actions
    def index( type )
      rows = params[:rows] || 20
      page = params[:page] || 1
      query = "has_model_ssim:\"info:fedora/afmodel:#{type}\""
      @response, @document = get_search_results(:q => query, :rows => rows, :page => page )
    end
    def show
      @document = get_single_doc_via_search(1, { :q => "id:#{params[:id]}" } )
    end
    def new
      #@mads_topic = MadsTopic.new
      @mads_schemes = list_records( "MadsScheme", "name_tesim" )
    end
    def create( obj, key )
      #@mads_topic = MadsTopic.new
      obj.attributes = params[key]
      if obj.save!
        redirect_to obj
      else
        flash[:alert] = "Unable to save record"
        render :new
      end
    end
    def edit
      #@mads_topic = MadsTopic.find( params[:id] )
      @mads_schemes = list_records( "MadsScheme", "name_tesim" )
    end
    def update( obj, key )
      #@mads_topic = MadsTopic.find( params[:id] )
      obj.attributes = params[key]
      if obj.save
        redirect_to obj
      else
        flash[:alert] = "Unable to save record"
        render :new
      end
    end
  
  end
end
