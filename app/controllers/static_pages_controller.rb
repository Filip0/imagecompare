class StaticPagesController < ApplicationController

	def welcome
	end

	def faq
	end

	def about
	end

	def compare
		# Adds two different random images from the database to image1 and image2.
		offset1 = rand(Image.count)
		offset2 = rand(Image.count)

		rand1 = Image.offset(offset1).first
		rand2 = Image.offset(offset2).first
		while rand1 == rand2 do
			offset2 = rand(Image.count)
			rand2 = Image.offset(offset2).first
		end

		@image1 = Image.find(rand1)
		@image2 = Image.find(rand2)
	end

	def update
		# Updates the upvotes for the image pressed
		@image = Image.find(params[:id])
		@image.upvotes += 1
		@image.save
		puts @image.upvotes

		redirect_to(:compare)
	end

end
