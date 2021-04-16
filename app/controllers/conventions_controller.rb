class ConventionsController < ApplicationController
	def index
		@conventions = Convention.where(status: 'active')
	end
end
