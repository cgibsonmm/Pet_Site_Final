class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy, :crop]
  before_action :set_posts, only: [:index]
  before_action :authenticate_user!
  before_action :set_user

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.all
  end

  # GET /animals/1
  # GET /animals/1.json
  def show; end

  # GET /animals/new
  def new
    @animal = current_user.animals.build
  end

  # GET /animals/1/edit
  def edit; end

  # POST /animals
  # POST /animals.json
  def create
    @animal = current_user.animals.build(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to user_animals_path(@user), notice: 'Animal was successfully created.' }
        format.json { render :index, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    respond_to do |format|
      if @animal.update(update_params)
        format.html { redirect_to user_animals_url(@user), notice: 'Animal was successfully updated.' }
        format.json { render :index, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to user_animals_url(@user, @animal), notice: 'Animal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def crop
    render 'crop'
  end

  private

  def set_posts
    @post = PhotoPost.all
  end

  def set_user
    @user = current_user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_animal
    @animal = Animal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def animal_params
    params.require(:animal).permit(:image, :name, :user_id, :dob, :species, :medical_history)
  end

  def update_params
    params.require(:animal).permit(
      :image,
      :image_original_w,
      :image_original_h,
      :image_crop_x,
      :image_crop_y,
      :image_crop_w,
      :image_crop_h,
      :image_box_w,
      :image_aspect,
      :name,
      :dob,
      :species,
      :medical_history
    )
  end
end
