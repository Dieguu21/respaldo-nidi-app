# frozen_string_literal: true

# Controlador para modelo de reseñas.
class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

  def show
    @rating = Rating.find(params[:id])
    # obtenemos el turno para colocar el nombre
    turno_id = @rating.turn_id
    @turno = Turn.find(turno_id)
  end

  # GET /reseñas/new
  def new
    @turno = Turn.find(params[:id])
    # id chofer
    id_chofer = @turno.user_id
    # chofer
    @chofer = User.find(id_chofer)
    @rating = Rating.new
    @rating.user_id = current_user.id
    @rating.turn_id = @turno.id
  end

  # POST /reseñas/new/id
  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to ratings_path, notice: 'Reseña creada correctamente'
    else
      redirect_to 'new', notice: 'Error al crear reseña'
    end
  end

  # Edit
  def edit
    @rating = Rating.find(params[:id])
    @chofer = User.find(Turn.find(@rating.turn_id).user_id)
  end

  # Update
  def update
    @ratings = Rating.find(params[:id])
    if @ratings.update(rating_params)
      redirect_to @ratings
    else
      render 'edit'
    end
  end

  # Delete
  def destroy
    @ratings = Rating.find(params[:id])
    @ratings.destroy
    redirect_to ratings_path
  end
end

private

def rating_params
  params.require(:rating).permit(:user_id, :turn_id, :content, :stars)
end
