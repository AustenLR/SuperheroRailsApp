class Superhero < ActiveRecord::Base
  has_many :team_superheros, dependent: :destroy
  has_many :teams, through: :team_superheros

  belongs_to :user
end
