class ArticleCatsController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :logged_in_admin
  before_action :set_article_cat, only: %i[ show edit update destroy ]
  layout 'main'
  
  # GET /article_cats or /article_cats.json
  def index
    @article_cats = ArticleCat.all
  end
  
  # GET /article_cats/1 or /article_cats/1.json
  def show
    @article_cat = ArticleCat.find(params[:id])
  end
  
  # GET /article_cats/new
  def new
    @article_cat = ArticleCat.new
  end
  
  # GET /article_cats/1/edit
  def edit
  end
  
  # POST /article_cats or /article_cats.json
  def create
    @article_cat = ArticleCat.new(article_cat_params)
  
    # respond_to do |format|
    if @article_cat.save
      redirect_to '/admin_view?which=article_cat'
      flash[:notice] = "新しい記事カテゴリーが作成されました！"
      # format.html { redirect_to article_cat_url(@article_cat), notice: "ArticleCat was successfully created." }
      # format.json { render :show, status: :created, location: @article_cat }
    else
      flash.now[:alert] = "作成に失敗しました"
      # format.html { render :new, status: :unprocessable_entity }
      # format.json { render json: @article_cat.errors, status: :unprocessable_entity }
    end
    # end
  end
  
  # PATCH/PUT /article_cats/1 or /article_cats/1.json
  # def update
  #   # respond_to do |format|
  #   if @article_cat.update(article_cat_params)
  #     redirect_to "/article_cats/" + params[:id] + "/edit"
  #     flash[:notice] = "記事カテゴリーが更新されました！"
  #     # format.html { redirect_to article_cat_url(@article_cat), notice: "ArticleCat was successfully updated." }
  #     # format.json { render :show, status: :ok, location: @article_cat }
  #   else
  #     flash.now[:alert] = "作成に失敗しました"
  #     # format.html { render :edit, status: :unprocessable_entity }
  #     # format.json { render json: @article_cat.errors, status: :unprocessable_entity }
  #   end
  #   # end
  # end
  
  # DELETE /article_cats/1 or /article_cats/1.json
  def destroy
    @article_cat.destroy
  
    respond_to do |format|
      format.html { redirect_to article_cats_url, notice: "ArticleCat was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_cat
      @article_cat = ArticleCat.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def article_cat_params
      params.require(:article_cat).permit(:name)
    end
end
