class ConventionsController < ApplicationController
	def index
		@conventions = Convention.where(status: 'active')
	end
	def show
		@convention = Convention.friendly.find(params[:id])
	end
	
end
