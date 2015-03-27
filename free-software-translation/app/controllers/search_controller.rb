class SearchController < ApplicationController

  require "uri"
  
  def index
    @term = Term.find_by_term(params[:term].rstrip.lstrip.downcase)
    if params[:term] == ''
      #if term is empty string redirect to search
      redirect_to "/main"
    elsif @term == nil
      #if term is not in db redirect to custom search
      redirect_to "/custom?term=#{URI.escape(params[:term].rstrip.lstrip)}"
    else
      @s2 = Translator.where({term_id: (@term.id)})
    end
  end
  
  def custom
    # Just loads the view file
  end
  
  def custom_translation
    cs1 = BingTranslator.new('free-software-translation',
    ENV['BING_TRANSLATE_KEY'], params)
    @es = cs1.translate((params[:translate]), :from => 'en', :to => 'es')
    @fr = cs1.translate((params[:translate]), :from => 'en', :to => 'fr')
    @de = cs1.translate((params[:translate]), :from => 'en', :to => 'de')
    @it = cs1.translate((params[:translate]), :from => 'en', :to => 'it')
    @cs1 = (params[:translate])
  end
  
  def show

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
