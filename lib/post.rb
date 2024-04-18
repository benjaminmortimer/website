require 'yaml'

class Post

	attr_reader :title, :published_at

	@@sitemap = YAML.load_file("./sitemap.yaml")

	def self.find(path)
		if !@@sitemap.keys.include?(path)
			false
		else
			self.new(@@sitemap[path], path)
		end
	end

	def initialize(metadata, path)
		@title = metadata["title"]
		@published_at = metadata["published_at"]
		@markdown_filepath = "./source/#{path}.md"
	end

	def content
		File.read(@markdown_filepath)
	end

end
