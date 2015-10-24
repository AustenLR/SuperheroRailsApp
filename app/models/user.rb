class User < ActiveRecord::Base
  has_secure_password

  has_many :superheros
  has_many :teams
end
