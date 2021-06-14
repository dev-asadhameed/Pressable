# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :friends

  def friends
    ActiveModelSerializers::SerializableResource.new(object.friends, each_serializer: UserLimitedSerializer)
  end
end
