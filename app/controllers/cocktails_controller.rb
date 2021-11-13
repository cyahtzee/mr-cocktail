class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:create, :show]

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect cocktails_path
    else
      render :new
    end
  end

  def show
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
    params.require(:cocktail).permit(:name)
  end
end
