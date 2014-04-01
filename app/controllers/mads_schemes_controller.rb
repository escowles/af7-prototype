class MadsSchemesController < ApplicationController
  include Blacklight::Catalog

  # solr actions
  def index
    @response, @document = get_search_results(:q => 'has_model_ssim:"info:fedora/afmodel:MadsScheme"' )
  end
  def show
    @document = get_single_doc_via_search(1, { :q => "id:#{params[:id]}" } )
  end
  def new
    @mads_scheme = MadsScheme.new
  end
  def create
    @mads_scheme = MadsScheme.new
    @mads_scheme.attributes = params[:mads_scheme]
    if @mads_scheme.save!
      redirect_to mads_scheme_path(@mads_scheme)
    else
      flash[:alert] = "Unable to save Scheme"
      render :new
    end
  end
  def edit
    @mads_scheme = MadsScheme.find( params[:id] )
  end
  def update
    @mads_scheme = MadsScheme.find( params[:id] )
    @mads_scheme.attributes = params[:mads_scheme]
    if @mads_scheme.save
      redirect_to mads_scheme_path(@mads_scheme)
    else
      flash[:alert] = "Unable to save Scheme"
      render :new
    end
  end
end
