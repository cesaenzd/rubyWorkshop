class EventsController < ApplicationController
  before_action :set_event,      only: [:show, :edit, :update, :destroy, :register_user]
  before_action :is_event_full?, only: :register_user
  before_action :set_user,       only: :register_user
  before_action :valid_email?,   only: :register_user

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def register
    @event = Event.find(params[:id])
    @users_of_event = @event.users
  end

  def register_user
    if @user.nil? || @event.users.include?(@user)
      redirect_to register_to_event_path(@event), notice: 'No se puede agregar usuario al evento'
      return
    end

    @event.users << @user
    redirect_to register_to_event_path(@event), notice: 'Usuario guardado con exito'
  end

  private
    def set_user
      email = params[:email]
      @user = User.where(email: email).take #limit one using take
    end

    def valid_email?
      if params[:email].blank? || params[:email] !~ User::VALID_EMAIL_REGEX
        redirect_to register_to_event_path(@event), notice: 'Debes especificar un correo electronico'
      end
    end

    def is_event_full?
      if @event.is_full?
        redirect_to register_to_event_path(@event), notice: 'El evento ya esta lleno'
        #redirect_to es el controlador que invoca al modelo
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :start_date, :end_date, :max_students, :description)
    end
end
