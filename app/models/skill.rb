class Skill < ApplicationRecord
  validates_presence_of :title, :percenet_utilized
end
