require 'json'

namespace:imgur do 
    desc "Export to txt"
    task :import, [:arg1] =>  :environment do |t, args|
        file = File.read(args[:arg1])
        data_hash = JSON.parse(file)
        for image in data_hash['data']
        	if not image['is_album']
	       		i = Image.new
	       		i.url = image['link']
	       		i.title = image['title']
	       		i.width = image['width']
	       		i.height = image['height']
	       		i.img_id = image['id']
	       		i.type = image['type']

	       		if i.save
	       			section = image['section']
	       			category = Category.find_by(name: section)
	       			if category.nil?
	       				cat = Category.create(name: section)
	       			else
	       				category.images << i
	       			end
	       		end
	       	end
        end
    end
end