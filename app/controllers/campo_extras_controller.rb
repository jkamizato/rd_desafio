class CampoExtrasController < ApplicationController
  before_action :set_campo_extra, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /campo_extras
  # GET /campo_extras.json
  def index
    @campo_extras = CampoExtra.all
  end

  # GET /campo_extras/1
  # GET /campo_extras/1.json
  def show
  end

  # GET /campo_extras/new
  def new
    @campo_extra = CampoExtra.new
  end

  # GET /campo_extras/1/edit
  def edit
  end

  # POST /campo_extras
  # POST /campo_extras.json
  def create
    @campo_extra = CampoExtra.new(campo_extra_params)

    respond_to do |format|
      if @campo_extra.save
        format.html { redirect_to @campo_extra, notice: 'Campo extra was successfully created.' }
        format.json { render :show, status: :created, location: @campo_extra }
      else
        format.html { render :new }
        format.json { render json: @campo_extra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campo_extras/1
  # PATCH/PUT /campo_extras/1.json
  def update
    respond_to do |format|
      if @campo_extra.update(campo_extra_params)
        format.html { redirect_to @campo_extra, notice: 'Campo extra was successfully updated.' }
        format.json { render :show, status: :ok, location: @campo_extra }
      else
        format.html { render :edit }
        format.json { render json: @campo_extra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campo_extras/1
  # DELETE /campo_extras/1.json
  def destroy
    @campo_extra.destroy
    respond_to do |format|
      format.html { redirect_to campo_extras_url, notice: 'Campo extra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campo_extra
      @campo_extra = CampoExtra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campo_extra_params
      params.require(:campo_extra).permit(:label, :campo_tipo, :user_id, :select_option)
    end
end
