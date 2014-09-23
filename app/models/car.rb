class Car < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand
  belongs_to :type
  belongs_to :color #could also be many to many...
end
