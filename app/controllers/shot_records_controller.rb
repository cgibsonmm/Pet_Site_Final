class ShotRecordsController < ApplicationController
  before_action :set_animal


  # May use this
  # def new
  #   respond_to do |format|
  #     format.html { render :new}
  #     format.js
  #   end
  # end

  def create
    @shot_record = @animal.shot_records.build(record_params)
    if @shot_record.validate(params[:name])
      @shot_record.save
      flash[:success] = 'Successfully created Shot Record'
      respond_to do |format|
        format.html { redirect_to user_animals_path(current_user)}
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @shot_record.errors.full_messages, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript'}
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
