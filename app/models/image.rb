class Image < ActiveRecord::Base
	has_and_belongs_to_many :categories
	has_many :upvotes

	def scale
			url = self.url
			a = url.reverse.split(".",2).map(&:reverse).reverse
			if a[1] != "gif"
				a[0] += 'l'
			end
			return a[0]+"."+a[1]
	end
end
