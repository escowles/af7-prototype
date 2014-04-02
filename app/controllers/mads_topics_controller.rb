class MadsTopicsController < Dams::MadsController

  def index
    super("MadsTopic")
  end
  def new
    @mads_topic = MadsTopic.new
    super
  end
  def create
    @mads_topic = MadsTopic.new
    super( @mads_topic, :mads_topic )
  end
  def edit
    @mads_topic = MadsTopic.find( params[:id] )
    super
  end
  def update
    @mads_topic = MadsTopic.find( params[:id] )
    super( @mads_topic, :mads_topic )
  end

end
