class StaticPagesController < ApplicationController

	def welcome
	end

	def faq
	end

	def about
	end

	def sitemap
		@categories = Category.all
	end

end
