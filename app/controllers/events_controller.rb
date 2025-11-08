class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.includes(:client).all

    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @events = @events.where(
        "name ILIKE ? OR event_type ILIKE ? OR state ILIKE ? OR address ILIKE ?",
        search_term, search_term, search_term, search_term
      )
    end
    @events = @events.page(params[:page]).per(10)
  end

  def new
    @event = Event.new
    @clients = Client.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, notice: 'Evento agregado exitosamente.'
    else
      @clients = Client.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @clients = Client.all
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: 'Evento actualizado correctamente.'
    else
      @clients = Client.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Evento eliminado exitosamente.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :client_id, :event_type, :start_date, :end_date, :address, :state)
  end
end

