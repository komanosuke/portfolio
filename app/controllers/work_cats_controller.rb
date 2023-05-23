class WorkCatsController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :logged_in_admin
  before_action :set_work_cat, only: %i[ show edit update destroy ]
  layout 'main'
    
    # GET /work_cats or /work_cats.json
    def index
      @work_cats = WorkCat.all
    end
    
    # GET /work_cats/1 or /work_cats/1.json
    def show
      @work_cat = WorkCat.find(params[:id])
    end
    
    # GET /work_cats/new
    def new
      @work_cat = WorkCat.new
    end
    
    # GET /work_cats/1/edit
    def edit
    end
    
    # POST /work_cats or /work_cats.json
    def create
      @work_cat = WorkCat.new(work_cat_params)
    
      # respond_to do |format|
      if @work_cat.save
        redirect_to '/admin_view?which=work_cat'
        flash[:notice] = "新しい商品カテゴリーが作成されました！"
        # format.html { redirect_to work_cat_url(@work_cat), notice: "WorkCat was successfully created." }
        # format.json { render :show, status: :created, location: @work_cat }
      else
        flash.now[:alert] = "作成に失敗しました"
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @work_cat.errors, status: :unprocessable_entity }
      end
      # end
    end
    
    # PATCH/PUT /work_cats/1 or /work_cats/1.json
    # def update
    #   # respond_to do |format|
    #   if @work_cat.update(work_cat_params)
    #     redirect_to "/work_cats/" + params[:id] + "/edit"
    #     flash[:notice] = "商品カテゴリーが更新されました！"
    #     # format.html { redirect_to work_cat_url(@work_cat), notice: "WorkCat was successfully updated." }
    #     # format.json { render :show, status: :ok, location: @work_cat }
    #   else
    #     flash.now[:alert] = "作成に失敗しました"
    #     # format.html { render :edit, status: :unprocessable_entity }
    #     # format.json { render json: @work_cat.errors, status: :unprocessable_entity }
    #   end
    #   # end
    # end
    
    # DELETE /work_cats/1 or /work_cats/1.json
    def destroy
      @work_cat.destroy
    
      respond_to do |format|
        format.html { redirect_to work_cats_url, notice: "WorkCat was successfully destroyed." }
        format.json { head :no_content }
      end
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_work_cat
        @work_cat = WorkCat.find(params[:id])
      end
    
      # Only allow a list of trusted parameters through.
      def work_cat_params
        params.require(:work_cat).permit(:name)
      end
end
  