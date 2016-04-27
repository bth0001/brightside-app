class BrightsidesController < ApplicationController
  before_action :signed_in_user
  before_action :set_brightside, only: [:show, :edit, :update, :destroy]
  before_action :verify_correct_user, only: [:show, :edit, :update, :destroy]

  # GET /brightsides
  # GET /brightsides.json
  def index
    @brightsides = current_user.brightsides.order(created_at: :desc)
  end

  # GET /brightsides/1
  # GET /brightsides/1.json
  def show
  end

  # GET /brightsides/new
  def new
    @brightside = Brightside.new
  end

  # GET /brightsides/1/edit
  def edit
  end

  # POST /brightsides
  # POST /brightsides.json
  def create
    @brightside = Brightside.new(brightside_params)
    @brightside.user = current_user  # associate the new brightside to the current_user

    respond_to do |format|
      if @brightside.save
        format.html { redirect_to @brightside_path, notice: 'Brightside was successfully created.' }
        format.json { render :show, status: :created, location: @brightside }
      else
        format.html { render :new }
        format.json { render json: @brightside.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brightsides/1
  # PATCH/PUT /brightsides/1.json
  def update
    respond_to do |format|
      if @brightside.update(brightside_params)
        format.html { redirect_to @brightsides_path, notice: 'Brightside was successfully updated.' }
        format.json { render :show, status: :ok, location: @brightside }
      else
        format.html { render :edit }
        format.json { render json: @brightside.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brightsides/1
  # DELETE /brightsides/1.json
  def destroy
    @brightside.destroy
    respond_to do |format|
      format.html { redirect_to brightsides_path, notice: 'Brightside was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brightside
      @brightside = Brightside.find(params[:id])
    end

    def verify_correct_user
      @brightside = current_user.brightsides.find_by(id: params[:id])
      redirect_to root_url, notice: 'You do not have access to this page!' if @brightside.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brightside_params
      params.require(:brightside).permit(:title, :entry)
    end
end
