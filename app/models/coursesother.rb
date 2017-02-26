class Coursesother < ActiveRecord::Base
	belongs_to :Coursesothers, 
	:class_name => "Coursesother", 
	:foreign_key => "id"
end