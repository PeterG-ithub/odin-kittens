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
      flash[:notice] = "Error when adding kitten"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kittens_param)
      flash[:notice] = "Kitten successfully saved"
      redirect_to kitten_path
    else
      flash[:notice] = "Error when editing Cat"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def kittens_param
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
