class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :picture

  def picture
    {
      default: object.picture.default,
      thumb: object.picture.thumb
    }
  end
end
