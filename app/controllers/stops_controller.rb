class StopsController <ApplicationController

  def index
    @stops = Stop.all
  end

  def new
    @stop = Stop.new()
  end

  def create
    @stop = Stop.new(stop_params)
    if @stop.save
      flash[:notice] = "Stop Creation Success-ation"
      redirect_to "/stops"
    else
      flash[:notice] = "once again you have failed me."
      render "new"
    end
  end

  def edit
    @stop = Stop.find(params[:id])
  end

  def show
    @stop = Stop.find(params[:id])
  end

  def update
    @stop = Stop.find(params[:id])
    @stop.update(stop_params)
    redirect_to "/stops"
  end

  def destroy
    @stop = Stop.find(params[:id])
    @stop.destroy
    redirect_to "/stops"
  end

private
  def stop_params
  params.require(:stop).permit(:station_id, :line_id)
  end
end
