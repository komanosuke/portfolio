require "ruby/openai"
require 'mechanize'
class ExamplesController < ApplicationController
	layout 'example'
	
	def cost
		if logged_in?
			@lifecost = Lifecost.find_by(user_id: current_user.id)
		end
	end

	def update
		@lifecost = Lifecost.find_by(user_id: current_user.id)
		respond_to do |format|
			if @lifecost.update(lifecost_params)
				format.html { redirect_to '/cost/' }
				format.js
			else
				flash[:alert] = "作成に失敗しました"
				redirect_to '/cost/'
			end
		end
	end

	def portrait
		
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

	private
	def lifecost_params
		params.permit(:twenty, :thirty, :forty, :fifty, :sixty, :marriage, :child, :house, :car, :care, :rent, :utility, :internet, :insurance, :car_cost, :child_care, :lesson, :transport, :pocket_money, :other_cost, :food, :necessity, :medical_cost, :child_lesson, :clothes, :beauty, :companionship, :entertainment, :small_cost, :exception, :marriage_total, :child_total, :house_total, :car_total, :tax, :pension)
	end

end