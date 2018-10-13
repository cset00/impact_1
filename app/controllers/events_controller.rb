class EventsController < ApplicationController

  def index
    @events = Events.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end
end