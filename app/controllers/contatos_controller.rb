class ContatosController < ApplicationController
  before_action :set_contato, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /contatos
  def index
    @contatos = Contato.where user_id: current_user.id
  end

  # GET /contatos/1
  def show
    initialize_campos_valor_extra
    load_valor_extra_by_contact params[:id]
  end

  # GET /contatos/new
  def new
    @contato = Contato.new
    initialize_campos_valor_extra
  end

  # GET /contatos/1/edit
  def edit
    initialize_campos_valor_extra
    load_valor_extra_by_contact params[:id]
  end

  # POST /contatos
  def create
    @contato = Contato.new(contato_params)
    if @contato.save
      create_campo_extra
      redirect_to @contato, notice: 'Contato was successfully created.'
    else
      initialize_campos_valor_extra
      render :new
    end
  end

  # PATCH/PUT /contatos/1
  def update
    if @contato.update(contato_params)
      create_campo_extra
      redirect_to @contato, notice: 'Contato was successfully updated.'
    else
      initialize_campos_valor_extra
      render :edit
    end
  end

  # DELETE /contatos/1
  def destroy
    @contato.destroy
    redirect_to contatos_url, notice: 'Contato was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contato
      @contato = Contato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contato_params
      params.require(:contato).permit(:email, :user_id)
    end

    # Prepare params for valor_extra
    def valor_extra_params(campo_extra_id, chave_valor)
        valor_extra = Hash.new
        valor_extra['campo_extra_id'] = campo_extra_id
        valor_extra['contato_id'] = @contato.id
        chave_valor.each { |chave, valor| valor_extra['valor'] = valor}
        valor_extra
    end

    # salva o campo extra
    def create_campo_extra
      if params[:campo_extra]
        params[:campo_extra].each do |campo_extra_id, chave_valor|
          @valor = ValorExtra.new(valor_extra_params(campo_extra_id, chave_valor))
          @valor.save
        end
      end
    end

    # Carrega os valores @campo_extra e @valor_extra dafault para montar o formulario
    def initialize_campos_valor_extra
      @campo_extra = CampoExtra.where user_id: current_user.id
      @valor_extra = Hash.new
    end

    # carrega os valores do contato
    def load_valor_extra_by_contact(contato_id)
      valor_extra_record = ValorExtra.where contato_id: contato_id
      valor_extra_record.each do |campo|
        @valor_extra[campo.campo_extra_id] = campo.valor
      end
    end
end
