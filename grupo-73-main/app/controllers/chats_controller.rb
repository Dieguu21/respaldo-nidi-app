# frozen_string_literal: true

# Controlador de chats
class ChatsController < ApplicationController
  def index
    # Lista de mensajes del current_user
    @chats = current_user.chats
    # Lista los turnos creados por current_user
    @turns = Turn.where(user_id: current_user.id)
    # Lista de solicitudes del current_user
    @requests = Request.where(user_id: current_user.id)
  end

  def new
    @turno = Turn.find(params[:id])
    @usuario_actual = current_user.id
    @requests = Request.all

    @chats = Chat.all
    @chat = Chat.new
  end

  def create
    @turno = Turn.find(params[:id])
    @chat = Chat.new(chat_params)
    @chat.user_id = current_user.id
    @chat.turn_id = @turno.id

    @chat.save
    redirect_to chats_new_path
  end

  def show; end

  def chat_params
    params.permit(:mensajes)
  end
end
