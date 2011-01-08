class RealtiesController < ApplicationController
  
  def index
    @realties = Realty.all
  end

  def show
    @realty = Realty.find(params[:id])
  end
  
  def new
    @realty = Realty.new
  end
  
  def create
    @realty = Realty.new(params[:realty])
    if @realty.save
      flash[:notice] = "All great!! #{@realty.address} has been saved"
      redirect_to realties_path
    else
      render :action => 'new'
    end
  end  

  def edit
    @realty = Realty.find(params[:id])
    3.times do
      @realty.realty_images.build if @realty.realty_images.empty?
    end
  end
  
  def update
    @realty = Realty.find(params[:id])
    if @realty.update_attributes(params[:realty])
      flash[:notice] = "All Great!! #{@realty.address} updated"
      redirect_to realties_path
    else
      render :action => 'edit'
    end  
  end
  
  def destroy
    if @realty = Realty.find(params[:id])
      if @realty.destroy
        flash[:notice] = "Ok, now you did it. You destroyed the realty with address #{@realty.address}, remember that you were warned when your he asks you why this realty isn't showing any more."
        redirect_to realties_path
      else
        render :action => 'index'
      end  
    else 
      flash[:notice] = "Hehe, you already destroyed this realty (or you're trying to hack our site). Don't be an ass and use this site as it was intended."
        render :action => 'index'
    end
  end
end
