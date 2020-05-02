class MessagesController < ApplicationController

    def index
        @messages = Message.all
        render json: @messages
    end

    def show
        @message = Message.find_by(id:params[:id])
    end

    def create
        room = Room.find_by(id:message_params[:room_id])
        user = User.find_by(id:message_params[:user_id])
        @message = Message.create(message_params)
        if @message.valid?
            RoomsChannel.broadcast_to(room, @message)
            render json: @message, status: :created, location: @message
            # RoomsChannel.broadcast_to(room,{
            #     room: RoomSerializer.new(room),
            #     users: UserSeralizer.new(room.users),
            #     messages: MessageSerializer.new(room.messages)
            # })
        else    
            render json:@message.errors
        end
    end

    private 
    def message_params
        params.require(:message).permit(:content, :user_id, :room_id)
    end
end
