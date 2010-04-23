class Paste < ActiveRecord::Base
  validates_presence_of :author, :title, :language
end
