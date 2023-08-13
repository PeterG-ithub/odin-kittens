class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kittens_param)
    if @kitten.save
      flash[:notice] = "Kitten successfully added"
      redirect_to @kitten
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def kittens_param
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
