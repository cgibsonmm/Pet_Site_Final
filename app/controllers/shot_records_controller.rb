class ShotRecordsController < ApplicationController
  before_action :set_animal
  def create
    @shot_record = @animal.shot_records.build(record_params)
    if @shot_record.save
      flash[:success] = 'Successfully created Shot Record'
      respond_to do |format|
        format.html { redirect_to user_animals_path(current_user)}
        format.js
      end
    end

  end


  private

  def record_params
    params.require(:shot_record).permit(:name, :due_date, :date_recived, :frequency, :animal_id)
  end

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end
end
