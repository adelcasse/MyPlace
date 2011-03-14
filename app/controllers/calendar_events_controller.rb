#MyPlace, by Arnaud Delcasse
# This project is licenced under the terms of the MIT Licence. See
# MIT-LICENCE.txt for more details

class CalendarEventsController < ApplicationController
  # GET /calendar_events
  # GET /calendar_events.xml
  def index
    @calendar_events = CalendarEvent.where(:owner => current_user.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calendar_events }
      format.json  { render :json => @calendar_events.to_a.to_json }
    end
  end

  # GET /calendar_events/1
  # GET /calendar_events/1.xml
  def show
    @calendar_event = CalendarEvent.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }# show.html.erb
      format.xml  { render :xml => @calendar_event }
    end
  end

  # GET /calendar_events/new
  # GET /calendar_events/new.xml
  def new
    @calendar_event = CalendarEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calendar_event }
    end
  end

  # GET /calendar_events/1/edit
  def edit
    @calendar_event = CalendarEvent.find(params[:id])
  end

  # POST /calendar_events
  # POST /calendar_events.xml
  def create
    params[:calendar_event][:start]=params[:calendar_event][:start_date]
    params[:calendar_event][:start]+=' '+params[:calendar_event][:start_time] unless params[:calendar_event][:start_time].nil? or params[:calendar_event][:start_time].empty?
    params[:calendar_event][:end]=params[:calendar_event][:end_date]
    params[:calendar_event][:end]+=' '+params[:calendar_event][:end_time] unless params[:calendar_event][:end_time].nil? or params[:calendar_event][:end_time].empty?
    @calendar_event = CalendarEvent.new(params[:calendar_event])
    @calendar_event.owner = current_user.id

    respond_to do |format|
      if @calendar_event.save
        format.html { redirect_to(@calendar_event, :notice => 'Calendar event was successfully created.') }
        format.xml  { render :xml => @calendar_event, :status => :created, :location => @calendar_event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calendar_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calendar_events/1
  # PUT /calendar_events/1.xml
  def update
    @calendar_event = CalendarEvent.find(params[:id])

    respond_to do |format|
      if @calendar_event.update_attributes(params[:calendar_event])
        format.html { redirect_to(@calendar_event, :notice => 'Calendar event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calendar_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calendar_events/1
  # DELETE /calendar_events/1.xml
  def destroy
    @calendar_event = CalendarEvent.find(params[:id])
    @calendar_event.destroy

    respond_to do |format|
      format.html { redirect_to(calendar_events_url) }
      format.xml  { head :ok }
    end
  end
end
