require "ruby/openai"
require 'mechanize'
class ExamplesController < ApplicationController
	layout 'example'
	
	def cost
		
	end

	def manga
		
	end

	def media
		agent = Mechanize.new
		page = agent.get("https://news.yahoo.co.jp/search?p=%E4%BA%BA%E5%B7%A5%E7%9F%A5%E8%83%BD&ei=utf-8")

		titles = page.search(".newsFeed_item_body .newsFeed_item_text .newsFeed_item_title").map(&:text)
		image_paths = page.search(".newsFeed_item_thumbnail .thumbnail img").map{ |img| img['src'] }
		links = page.search(".newsFeed_item_link").map{ |link| link['href'] }

		articles = titles.zip(image_paths, links).map{ |title, image, url| {title: title, image: image, url: url} }
		@articles = Kaminari.paginate_array(articles).page(params[:page]).per(9)
	end


end