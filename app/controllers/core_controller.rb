class CoreController < ApplicationController
  def index
  end

  def search
  	test="大"
  	@courses=Coursesmain.where("name LIKE ?", "%%#{test}%%")
  end

  def search_ajax
  	puts "called!"
  	@courses=Coursesmain.where("name LIKE ?", "%%#{params[:course]}%%")
  	respond_to do |format|
  		format.html {render 'core/search_ajax'}
  		format.js {render 'core/search_ajax'}
  		format.json {render 'core/search_ajax'}
  	end

  end

end
