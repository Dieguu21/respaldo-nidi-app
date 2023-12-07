# frozen_string_literal: true

# Controlador para modelo de request (apruebo o rechazo de solicitudes de turnos).
class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]

  # GET /requests
  def index
    @requests = current_user.requests
    # @request = Request.find(1) # esto es para probar, en el futuro deberiamos poder asociar a cada
    # turno su estado (que es el estdo de la tabla Request)
    # @turns = Turn.all
  end

  # GET /requests/1
  def show
    @turn_show = Turn.find(params[:id])
    # id del chofer (lo sacamos de tabla Turn)
    @chofer_id = @turn_show.user_id
    # elemento (fila) del chofer en tabla User
    @chofer = @turn_show.user

    # obtengo la request asociada (para poder mostrar la descripcion)
    requests = current_user.requests
    requests.each do |request|
      @request_actual = request if request.turn_id == @turn_show.id
    end
  end

  def pestana_solicitudes
    # listo los turnos que yo creé
    @mis_turnos = Turn.where(user_id: current_user.id)
    # lo siguiente es para poder mostrar la calificacion del pasajero

    # @users = User.all
  end

  def aceptar_solicitud
    @request = Request.find(params[:id])

    id_tuno = @request.turn_id
    @turn = (Turn.where(id: id_tuno))[0]

    # Como acepté, cambio estado de request a "Aceptado", y resto un espacio al turno
    @turn.av_space = @turn.av_space - 1
    @turn.save

    @request.status = 'Aceptado'
    @request.save

    # renderizo pestana_solicitudes
    redirect_to '/solicitudes'
  end

  def detalles_solicitud
    @request = Request.find(params[:id])

    id_tuno = @request.turn_id
    @turn = (Turn.where(id: id_tuno))[0]

    id_pasajero = @request.user_id
    @pasajero = (User.where(id: id_pasajero))[0]
  end

  def rechazar_solicitud
    @request = Request.find(params[:id])

    # cambio estado de request a "Rechazado"
    @request.status = 'Rechazado'
    @request.save

    # renderizo pestana_solicitudes
    redirect_to '/solicitudes'
  end

  # GET /requests/new
  def new
    @turn = Turn.find(params[:id])

    @request = Request.new
    # @request.turn_id = @turn.id
  end

  # GET /requests/1/edit
  def edit; end

  # POST /requests
  def create
    @turn = Turn.find(params[:id])
    @request = Request.new(request_params)

    if @turn.av_space.zero?
      @request.status = 'Rechazado'
    elsif @turn.av_space.positive?
      @request.status = 'Pendiente'
    end

    @request.user_id = current_user.id
    @request.turn_id = @turn.id

    if @request.save
      redirect_to '/requests'
    else
      p 'El error es el siguiente:'
      p @request.errors.full_messages
      render '#'
    end
  end

  # PATCH/PUT /requests/1
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to requests_show_path(@request), notice: 'Solicitud actualizada exitosamente' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @request = Request.find(params[:id])

    # primero disminuimos en 1 los espacios disponibles del turno (si estaba aceptado)
    if @request.status == 'Aceptado'
      id_turno = @request.turn_id
      turno = Turn.where(id: id_turno)
      turno[0].av_space = turno[0].av_space + 1
      turno[0].save
    end

    @request.destroy

    redirect_to '/requests'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @turn_show = Turn.find(params[:id])
    # id del chofer (lo sacamos de tabla Turn)
    @chofer_id = @turn_show.user_id
    # elemento (fila) del chofer en tabla User
    @chofer = @turn_show.user

    # obtengo la request asociada (para poder mostrar la descripcion)
    requests = current_user.requests
    requests.each do |request|
      @request_actual = request if request.turn_id == @turn_show.id
    end
  end

  # Only allow a list of trusted parameters through.
  def request_params
    params.require(:request).permit(:description)
    # , :turn_id, :user_id, :status
  end
end
