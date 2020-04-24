class RoomsController < ApplicationController

    def index
        rooms = Room.all
        render json: rooms
    end

    def show
        @room = Room.find_by(id:params[:id])
        render json: @room
    end

end
