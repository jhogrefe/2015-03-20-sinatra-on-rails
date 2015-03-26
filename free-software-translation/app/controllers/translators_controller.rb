class TranslatorsController < ApplicationController
  
  def index
    @translator = Translator.find :all
  end
  
  def show
    @translator = Translator.find params[:id]
  end
  
  def new
    @translator = Translator.new
  end
  
  def create
    @translator = Translator.new params[:translator]
    if @translator.save
      redirect_to :action => 'show', :id => @translator.id
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @translator = Translator.find params[:id]
    @translator.destroy
  end
  
  def edit
    @translator = Translator.find params[:id]
  end
  
  def update
    @translator = Translator.find params[:id]
    if @translator.update_attributes(params[:translator])
      redirect_to :action => 'show', :id => @translator.id
    end
  end  
  
end
