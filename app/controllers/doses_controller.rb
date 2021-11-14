class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end
  # def create
  #   @dose = Dose.new(doses_params)
  #   @dose.cocktail = Cocktail.new(cocktail_params)

  #   render :new if @dose.save && params[:commit] == 'Add ingredient'
  #   if @dose.save && params[:commit] == 'Create cocktail'
  #     redirect_to cocktail_path(@dose.cocktail)
  #   else
  #     render :new
  #   end
  # end

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  # def cocktail_params
  #   params.require(:dose).permit(:name)
  # end
end
