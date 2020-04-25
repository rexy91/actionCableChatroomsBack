class RoomsChannel < ApplicationCable::Channel

    # when a user is 'subscribed' it means they have loaded the relevant page and viewing it(the chat room)

    def subscribed
        # stream_for takes an object
        # subscriptions are being created on the RoomWebSocket component from the front end 
        @room = Room.find_by(id: params[:room_id])
        stream_for @room
    end

    # the second argument to broadcast_to matches the information getting from the frontend, 
    # and passing from the MessageController create action after creating new message 

    def received(data)
        RoomsChannel.broadcast_to(@room, {room: @room, users:@room.users, messages: @room.messages})
    end
    
    def unsubcribed
        # cleanup when channal is unsubscribed
    end
end
