class NewsCatsController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :logged_in_admin
  before_action :set_news_cat, only: %i[ show edit update destroy ]
  layout 'main'
    
    # GET /news_cats or /news_cats.json
    def index
      @news_cats = NewsCat.all
    end
    
    # GET /news_cats/1 or /news_cats/1.json
    def show
      @news_cat = NewsCat.find(params[:id])
    end
    
    # GET /news_cats/new
    def new
      @news_cat = NewsCat.new
    end
    
    # GET /news_cats/1/edit
    def edit
    end
    
    # POST /news_cats or /news_cats.json
    def create
      @news_cat = NewsCat.new(news_cat_params)
    
      # respond_to do |format|
      if @news_cat.save
        redirect_to '/admin_view?which=news_cat'
        flash[:notice] = "新しいニュースカテゴリーが作成されました！"
        # format.html { redirect_to news_cat_url(@news_cat), notice: "NewsCat was successfully created." }
        # format.json { render :show, status: :created, location: @news_cat }
      else
        flash.now[:alert] = "作成に失敗しました"
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @news_cat.errors, status: :unprocessable_entity }
      end
      # end
    end
    
    # PATCH/PUT /news_cats/1 or /news_cats/1.json
    # def update
    #   # respond_to do |format|
    #   if @news_cat.update(news_cat_params)
    #     redirect_to "/news_cats/" + params[:id] + "/edit"
    #     flash[:notice] = "ニュースカテゴリーが更新されました！"
    #     # format.html { redirect_to news_cat_url(@news_cat), notice: "NewsCat was successfully updated." }
    #     # format.json { render :show, status: :ok, location: @news_cat }
    #   else
    #     flash.now[:alert] = "作成に失敗しました"
    #     # format.html { render :edit, status: :unprocessable_entity }
    #     # format.json { render json: @news_cat.errors, status: :unprocessable_entity }
    #   end
    #   # end
    # end
    
    # DELETE /news_cats/1 or /news_cats/1.json
    def destroy
      @news_cat.destroy
    
      respond_to do |format|
        format.html { redirect_to news_cats_url, notice: "NewsCat was successfully destroyed." }
        format.json { head :no_content }
      end
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_news_cat
        @news_cat = NewsCat.find(params[:id])
      end
    
      # Only allow a list of trusted parameters through.
      def news_cat_params
        params.require(:news_cat).permit(:name)
      end
end
  