class ReportsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @report = current_user.reports.build(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human) }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end


  def edit
  end

  def destroy
  end

  private

  def report_params
    params.require(:report).permit(:title,:content)
  end
end
