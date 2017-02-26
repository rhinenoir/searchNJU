class CoreController < ApplicationController
  def index
  end

  def search
  end

  def search_ajax
  	@keyName=params[:course]
  	@keyTeachers=params[:teacher]
  	if @keyName.length == 0
  		@keyName="(None)"
  		if @keyTeachers.length == 0
  			@keyTeachers="(None)"
  			@coursesUsual=[]
  			@coursesOther=[]
  		else
  			@coursesUsual=Coursesmain.where("teacher LIKE ?", "%%#{@keyTeachers}%%")
			@coursesOther=Coursesother.where("teacher LIKE ?", "%%#{@keyTeachers}%%")
  		end
  	else
  		if @keyTeachers.length == 0
  			@keyTeachers="(None)"
  			@coursesUsual=Coursesmain.where("name LIKE ?", "%%#{@keyName}%%")
			@coursesOther=Coursesother.where("name LIKE ?", "%%#{@keyName}%%")
  		else	
  			@coursesUsual=Coursesmain.where("name LIKE ? AND teacher LIKE ?", "%#{@keyName}%", "%#{@keyTeachers}%")
			@coursesOther=Coursesother.where("name LIKE ? AND teacher LIKE ?", "%#{@keyName}%", "%#{@keyTeachers}%")
  		end	
  	end
  	respond_to do |format|
  		format.js {}
  	end
  end
end
