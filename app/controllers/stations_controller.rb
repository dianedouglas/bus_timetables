class StationsController <ApplicationController

  def index
    @stations = Station.all
  end

  def new
    @station = Station.new()
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:notice] = "Station Creation Success-ation"
      redirect_to "/stations"
    else
      flash[:notice] = "once again you have failed me."
      render "new"
    end
  end

  def edit
    @station = Station.find(params[:id])
  end

  def show
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])
    @station.update(station_params)
    redirect_to "/stations"
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    redirect_to "/stations"
  end

private
  def station_params
  params.require(:station).permit(:name)
  end
end
