class CampoExtrasController < ApplicationController
  before_action :set_campo_extra, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /campo_extras
  def index
    @campo_extras = CampoExtra.all
  end

  # GET /campo_extras/1
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
  def create
    @campo_extra = CampoExtra.new(campo_extra_params)

    if @campo_extra.save
      redirect_to @campo_extra, notice: 'Campo extra was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /campo_extras/1
  def update
    if @campo_extra.update(campo_extra_params)
      redirect_to @campo_extra, notice: 'Campo extra was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /campo_extras/1
  def destroy
    @campo_extra.destroy
    redirect_to campo_extras_url, notice: 'Campo extra was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campo_extra
      @campo_extra = CampoExtra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campo_extra_params
      params.require(:campo_extra).permit(:label, :campo_tipo, :user_id, :select_option, :chave)
    end
end
