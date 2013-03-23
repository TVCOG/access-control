class Card < ActiveRecord::Base
  belongs_to :user
  attr_accessible :card_id, :enabled, :site_code
end
