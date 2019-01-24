class Order < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant
	has_many :orders_list

	validates :count, :numericality => { :greater_than => 0 }, presence: true
	validates :address, presence: true
	validates_associated :user
  	validates_associated :restaurant
  	validate :valid_delivery_date?
  	


  	def valid_delivery_date?
	    unless delivery_time.today?
	      errors.add(:delivery_time, "date should be today!")
	    end
  	end

end
