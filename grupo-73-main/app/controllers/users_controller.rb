# frozen_string_literal: true

# Controlador creado por Devise para gestionar modelo de usuarios.
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end
