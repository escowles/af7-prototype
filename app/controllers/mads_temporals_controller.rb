class MadsTemporalsController < Dams::MadsController

  def index
    super("MadsTemporal")
  end
  def new
    @mads_temporal = MadsTemporal.new
    super
  end
  def create
    @mads_temporal = MadsTemporal.new
    super( @mads_temporal, :mads_temporal )
  end
  def edit
    @mads_temporal = MadsTemporal.find( params[:id] )
    super
  end
  def update
    @mads_temporal = MadsTemporal.find( params[:id] )
    super( @mads_temporal, :mads_temporal )
  end

end
