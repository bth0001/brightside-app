class ShinesController < ApplicationController
  before_action :set_shine, only: [:show, :edit, :update, :destroy]

  # GET /shines
  # GET /shines.json
  def index
    @shines = Shine.all
  end

  # GET /shines/1
  # GET /shines/1.json
  def show
  end

  # GET /shines/new
  def new
    @shine = Shine.new
  end

  # GET /shines/1/edit
  def edit
  end

  # POST /shines
  # POST /shines.json
  def create
    @shine = Shine.new(shine_params)

    respond_to do |format|
      if @shine.save
        format.html { redirect_to @shine, notice: 'Action was successfully created.' }
        format.json { render :show, status: :created, location: @shine }
      else
        format.html { render :new }
        format.json { render json: @shine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shines/1
  # PATCH/PUT /shines/1.json
  def update
    respond_to do |format|
      if @shine.update(shine_params)
        format.html { redirect_to @shine, notice: 'Action was successfully updated.' }
        format.json { render :show, status: :ok, location: @shine }
      else
        format.html { render :edit }
        format.json { render json: @shine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shines/1
  # DELETE /shines/1.json
  def destroy
    @shine.destroy
    respond_to do |format|
      format.html { redirect_to shines_url, notice: 'Action was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shine
      @shine = Shine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shine_params
      params.require(:shine).permit(:title, :completed)
    end
end
