class EventsController < ApplicationController

def index
	@events = Event.paginate(:page => params[:page], :per_page => 3)

	respond_to do |format|
		format.html # index.html.erb
		format.json { render json: @events }
	end
end

def show
	@event = Event.find(params[:id])

	respond_to do |format|
		format.html # show.html.erb
		format.json { render json: @event}
	end
end

def new
	@event = Event.new
end

def create
	@event = Event.new(params[:event])

	if @event.save
		redirect_to root_url, :notice => "Saved event!"
	end
end

end
