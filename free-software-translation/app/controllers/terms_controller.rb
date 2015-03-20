class TermsController < ApplicationController

  def index
    @term = Term.find :all
  end
  
  def show
    @term = Term.find params[:id]
  end
  
  def new
    @term = Term.new
  end
  
  def create
    @term = Term.new params[:term]
    if @term.save
      redirect_to :action => 'show', :id => @term.id
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @term = Term.find params[:id]
    @term.destroy
  end
  
  def edit
    @term = Term.find params[:id]
  end
  
  def update
    @term = Term.find params[:id]
    if @term.update_attributes(params[:term])
      redirect_to :action => 'show', :id => @term.id
    end
  end

end
