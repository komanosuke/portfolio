class NewsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show, :new, :edit, :create, :update]
  before_action :logged_in_admin, except: [:index, :show]
  before_action :set_news, only: %i[ show edit update destroy ]
  layout 'main'

  # GET /news or /news.json
  def index
    @news = News.all
  end

  # GET /news/1 or /news/1.json
  def show
    @news = News.find(params[:id])
  end

  # GET /news/new
  def new
    @news = News.new
    @news_cat = NewsCat.all

    @news_cat_id_list = []
    @news_cat.each do |nc|
      l = []
      l.push(nc.name)
      l.push(nc.id)
      @news_cat_id_list.push(l)
    end
  end

  # GET /news/1/edit
  def edit
    @news_cat_id_list = []
    @news_cats = NewsCat.all
    @news_cats.each do |nc|
      l = []
      l.push(nc.name)
      l.push(nc.id)
      @news_cat_id_list.push(l)
    end
  end

  # POST /news or /news.json
  def create
    @news = News.new(news_params)

    # respond_to do |format|
      if @news.save
        redirect_to '/admin_view?which=news'
        flash[:notice] = "新しいニュースが作成されました！"
        # format.html { redirect_to news_url(@news), notice: "News was successfully created." }
        # format.json { render :show, status: :created, location: @news }
      else
        flash.now[:alert] = "作成に失敗しました"
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /news/1 or /news/1.json
  def update
    # respond_to do |format|
      if @news.update(news_params)
        redirect_to "/news/" + params[:id] + "/edit"
        flash[:notice] = "ニュースが更新されました！"
        # format.html { redirect_to news_url(@news), notice: "News was successfully updated." }
        # format.json { render :show, status: :ok, location: @news }
      else
        flash.now[:alert] = "作成に失敗しました"
        # format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /news/1 or /news/1.json
  def destroy
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_url, notice: "News was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def news_params
      params.require(:news).permit(:news_cat_id, :title, :image, :image_title, :text)
    end
end
