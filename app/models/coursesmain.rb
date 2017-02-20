class Coursesmain < ActiveRecord::Base
	belongs_to :Coursesmains, 
	:class_name => "Coursemain", 
	:foreign_key => "num"

end