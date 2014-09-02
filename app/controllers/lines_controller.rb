class LinesController <ApplicationController

  def index
    @lines = Line.all
  end

  def new
    @line = Line.new()
  end

  def create
    @line = Line.new(line_params)
    if @line.save
      flash[:notice] = "Line Creation Success-ation"
      redirect_to "/lines"
    else
      flash[:notice] = "once again you have failed me."
      render "new"
    end
  end

  def edit
    @line = Line.find(params[:id])
  end

  def show
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    @line.update(line_params)
    redirect_to "/lines"
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    redirect_to "/lines"
  end

private
  def line_params
  params.require(:line).permit(:name)
  end

end
