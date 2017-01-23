class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @data = @survey.data
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = current_user.surveys.build(survey_params)
      if @survey.save
        Datum.import(@survey)
        flash[:success] = "データを登録しました。"
        redirect_to root_path
      else
        render 'new'
      end
  end
  def destroy
    Survey.find(params[:id]).destroy
    flash[:success] = "データを削除しました。"
    redirect_to surveys_url
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: '調査データを更新しました。' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name, :file)
    end
end
