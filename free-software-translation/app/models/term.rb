class Term < ActiveRecord::Base
  attr_accessible :term
  
  def translate_using_db
    s1 = Term.new(params)
    if s1.term == ''
      redirect to("/search")
    else
      s1 = Term.where({term: params[:term].downcase})
      if s1[0] == nil
        redirect to("/custom?term=#{params[:term]}")
      else @term = (params[:term])
      end
      @s2 = Translator.where({term_id: (s1[0].id)})
    end
  end
  
end