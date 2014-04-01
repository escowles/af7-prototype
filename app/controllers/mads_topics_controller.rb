class MadsTopicsController < ApplicationController
  include Blacklight::Catalog

  # solr actions
  def index
    @response, @document = get_search_results(:q => 'has_model_ssim:"info:fedora/afmodel:MadsTopic"' )
  end
  def show
    @document = get_single_doc_via_search(1, { :q => "id:#{params[:id]}" } )
  end
  def new
    @mads_topic = MadsTopic.new
    @mads_schemes = list_records( "MadsScheme", "name_tesim" )
  end
  def create
    @mads_topic = MadsTopic.new
    @mads_topic.attributes = params[:mads_topic]
    if @mads_topic.save!
      redirect_to mads_topic_path(@mads_topic)
    else
      flash[:alert] = "Unable to save Topic"
      render :new
    end
  end
  def edit
    @mads_topic = MadsTopic.find( params[:id] )
    @mads_schemes = list_records( "MadsScheme", "name_tesim" )
  end
  def update
    @mads_topic = MadsTopic.find( params[:id] )
    @mads_topic.attributes = params[:mads_topic]
    if @mads_topic.save
      redirect_to mads_topic_path(@mads_topic)
    else
      flash[:alert] = "Unable to save Topic"
      render :new
    end
  end

  def list_records( type, name_field )
    records = Array.new
    response, doc = get_search_results(:q => "has_model_ssim:info:fedora/afmodel:#{type}", :rows => '1000')
    doc.each do |obj|
      records << [obj[name_field].first, "http://library.ucsd.edu/ark:/20775/" + obj["id"]] if obj[name_field]
    end
    records
  end
end
