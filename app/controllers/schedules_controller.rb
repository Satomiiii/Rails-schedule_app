class SchedulesController < ApplicationController
  before_action :set_schedule, only: [ :show, :edit, :update, :destroy ]

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to @schedule, notice: "\u30B9\u30B1\u30B8\u30E5\u30FC\u30EB\u304C\u4F5C\u6210\u3055\u308C\u307E\u3057\u305F\u3002"
    else
      render :new
    end
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to @schedule, notice: "\u30B9\u30B1\u30B8\u30E5\u30FC\u30EB\u304C\u66F4\u65B0\u3055\u308C\u307E\u3057\u305F\u3002"
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_url, notice: "\u30B9\u30B1\u30B8\u30E5\u30FC\u30EB\u304C\u524A\u9664\u3055\u308C\u307E\u3057\u305F\u3002"
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo)
  end
end
