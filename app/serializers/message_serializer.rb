class MessageSerializer < ActiveModel::Serializer
  # to render the user it belongs to , just add to attribute 
  attributes :id, :content, :user, :user_id, :room_id
  # belongs_to :user
end
