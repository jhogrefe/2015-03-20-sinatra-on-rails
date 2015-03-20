class LangsController < ApplicationController
  
  def index
    @lang = Lang.find :all
  end
  
  def show
    @lang = Lang.find params[:id]
  end
  
  def new
    @lang = Lang.new
  end
  
  def create
    @lang = Lang.new params[:lang]
    if @lang.save
      redirect_to :action => 'show', :id => @lang.id
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @lang = Lang.find params[:id]
    @lang.destroy
  end
  
  def edit
    @lang = Lang.find params[:id]
  end
  
  def update
    @lang = Lang.find params[:id]
    if @lang.update_attributes(params[:lang])
      redirect_to :action => 'show', :id => @lang.id
    end
  end
  
end
