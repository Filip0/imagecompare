require 'json'

namespace:imgur do
    desc "Export to txt"
    task :import, [:arg1] =>  :environment do |t, args|
        puts "TEST"
        file = File.read(args[:arg1])
        puts "File read"
        data_hash = JSON.parse(file)
        puts "Parsing JSON"
        for image in data_hash['data']
        	puts image
        	if not image['is_album']
	       		i = Image.new
	       		i.url = image['link']
	       		i.title = image['title']
	       		i.width = image['width']
	       		i.height = image['height']
	       		i.img_id = image['id']
	       		i.filetype = image['type']

	       		if i.save
	       			puts "Saving image #{i.url}"
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