class MixesController < ApplicationController
  def new
  end

  def create
    @mix = Mix.new
    @mix.name = params[:mix][:name]
    respond_to do |format|
      if @mix.save
        format.html { redirect_to '/', notice: 'Mix was successfully created' }
        format.json { render :@mix.json }
      else
        format.html { render :new }
        format.json { render json: @mix.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @mixes = Mix.all
  end

  def destroy
    @mix = Mix.find(params[:id])
    @mix.destroy

    redirect_to root_path
  end

  def mix_params
    params.require(:mix).permit(:name)
  end
end
