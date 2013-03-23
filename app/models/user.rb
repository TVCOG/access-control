class User < ActiveRecord::Base
  attr_accessible :email, :member_id, :name
  has_many :cards
  
  # Use member_id as key
  def to_param
    member_id
  end
end
