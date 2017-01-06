class Admin::EventsController < Admin::AdminController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
  # @event.listed_by_user = current_user

    if @event.valid?
      @event.save!
      flash[:notice] = "#{@event.name} added."
      redirect_to action: :index
    else
      flash.now[:alert] = "Bad event. #{@event.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      flash[:notice] = "Event updated."
      redirect_to action: :index
    else
      flash.now[:alert] = "Event update failed. #{@event.errors.full_messages.join(', ')}"
      render :edit
    end

  end


  private

  def parse_datetimes_from_split_params
    event_params['start_at'] = parse_datetime( event_params[:start_time] )
    event_params['end_at'] = parse_datetime( event_params[:end_time] )
  end

  def parse_datetime(time)
    Time.strptime(event_params[:date] + time, '%m-%d-%Y%l:%M %p') rescue return
  end

  def event_params
    params.require(:event).permit(:name, :start_at_time, :end_at_time, :start_at_date, :end_at_date,
      :location_display_string, :description, :location_id, :registration_link)
  end


end
