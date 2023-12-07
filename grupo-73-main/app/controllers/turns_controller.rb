# frozen_string_literal: true

# Controlador par modelo de turnos ("Mis publicaciones" y "Lista de turnos").
class TurnsController < ApplicationController
  def index
    @turns = current_user.turns
  end

  def all
    @turns = Turn.all
  end

  def show
    @turn = Turn.find(params[:id])
  end

  def new
    @turn = Turn.new
  end

  def create
    @turn = Turn.new(turn_params)
    @turn.user_id = current_user.id
    @turn.av_space = turn_params[:max_space]
    # @turn.name = turn_params[:name]

    if @turn.save
      redirect_to turns_index_path
      flash[:notice] = 'Has creado un turno.'
    else
      p @turn.errors.full_messages
      render 'new'
    end
  end

  def edit
    @turn = Turn.find(params[:id])
  end

  def update
    @turn = Turn.find(params[:id])
    if @turn.update(turn_params)
      redirect_to @turn
    else
      render 'edit'
    end
  end

  def destroy
    @turn = Turn.find(params[:id])
    @turn.destroy
    redirect_to turns_index_path
  end

  private

  def turn_params
    params.require(:turn).permit(:name, :origin, :destination, :date, :time, :max_space)
  end
end
