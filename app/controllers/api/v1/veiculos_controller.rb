class Api::V1::VeiculosController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_veiculo, only: [ :show, :update, :destroy ]

  def index
    @veiculos = policy_scope(Veiculo)
  end

  def show
  end

  def update
    if @veiculo.update(veiculo_params)
      render :show
    else
      render_error
    end
  end

  def create
    @veiculo = Veiculo.new(veiculo_params)
    @veiculo.user = current_user
    authorize @veiculo
    if @veiculo.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @veiculo.destroy
    head :no_content

  end

  private

  def set_veiculo
    @veiculo = Veiculo.find(params[:id])
    authorize @veiculo
  end

  def veiculo_params
    params.require(:veiculo).permit(:marca)
  end

  def render_error
    render json: { errors: @veiculo.errors.full_messages },
          status: :unprocessable_entity
  end
end
