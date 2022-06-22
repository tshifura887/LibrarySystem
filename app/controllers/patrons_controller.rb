class PatronsController < ApplicationController
  before_action :set_patron, only: %i[ show edit update destroy ]

  def index
    @patrons = Patron.all
  end

  def show
  end

  def new
    @patron = Patron.new
  end

  def edit
  end

  def create
    @patron = Patron.new(patron_params)

    if @patron.save
        redirect_to patron_url(@patron), notice: "Patron was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @patron.update(patron_params)
      redirect_to patron_url(@patron), notice: "Patron was successfully updated." 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patron.destroy
    redirect_to patrons_url, notice: "Patron was successfully destroyed." 
  end

  private
    def set_patron
      @patron = Patron.find(params[:id])
    end

    def patron_params
      params.require(:patron).permit(:first_name, :last_name, :email)
    end
end
