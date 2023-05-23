class ArticlesController < ApplicationController
  before_action :logged_in_user, except: [:index, :show, :new, :edit, :create, :update]
  before_action :logged_in_admin, except: [:index, :show]
  before_action :set_article, only: %i[ show edit update destroy ]
  layout 'main'

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
    @article_cat = ArticleCat.all

    @article_cat_id_list = []
    @article_cat.each do |ac|
      l = []
      l.push(ac.name)
      l.push(ac.id)
      @article_cat_id_list.push(l)
    end
  end

  # GET /article/1/edit
  def edit
    @article_cat_id_list = []
    @article_cats = ArticleCat.all
    @article_cats.each do |ac|
      l = []
      l.push(ac.name)
      l.push(ac.id)
      @article_cat_id_list.push(l)
    end
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    # respond_to do |format|
      if @article.save
        redirect_to '/admin_view?which=article'
        flash[:notice] = "新しい商品が作成されました！"
        # format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        # format.json { render :show, status: :created, location: @article }
      else
        flash.now[:alert] = "作成に失敗しました"
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    # respond_to do |format|
      if @article.update(article_params)
        redirect_to "/articles/" + params[:id] + "/edit"
        flash[:notice] = "商品が更新されました！"
        # format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        # format.json { render :show, status: :ok, location: @article }
      else
        flash.now[:alert] = "作成に失敗しました"
        # format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:article_cat_id, :title, :image, :image_title, :text)
    end
end
