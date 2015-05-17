class AuthTokenSerializer < ActiveModel::Serializer
  attributes :token
  has_one :user, serializer: UserSerializer
end
