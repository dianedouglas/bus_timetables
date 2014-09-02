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
  end

  def show
  end

  def update
  end

  def destroy
  end

private
  def station_params
  params.require(:station).permit(:name)
  end
end
