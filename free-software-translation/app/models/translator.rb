class Translator < ActiveRecord::Base
  attr_accessible :translator, :term_id, :lang_id
end