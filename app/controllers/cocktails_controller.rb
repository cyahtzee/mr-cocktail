class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]

  def main
    @cocktail = Cocktail.new
  end

  def index
    if params[:query].present?
      query = <<-SQL
        cocktails.name ILIKE :query
        OR ingredients.name ILIKE :query
      SQL
      @cocktails = Cocktail.joins(:ingredients).where(query, query: "%#{params[:query]}%").distinct
    else
      @cocktails = Cocktail.all
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def show
    @dose = Dose.new
  end

  def alcoholic
    @cocktails = Cocktail.where(category: "Alcoholic")
    render action: :index
  end

  def virgin
    @cocktails = Cocktail.where(category: "Non alcoholic")
    render action: :index
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
