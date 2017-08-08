class Admin::ImportController < ApplicationController
  def index

    if !current_user || !current_user.admin?
      redirect_to root_path
      return;
    end

  end

  def import
    if !current_user || !current_user.admin?
      redirect_to root_path
      return;
    end

    Recipe.import(params[:file])
    redirect_to root_path, notice: "Recipes imported."
  end
end
