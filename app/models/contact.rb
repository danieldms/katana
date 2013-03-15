class Contact < ActiveRecord::Base
  	attr_accessible :name, :email, :subject, :message, :type, :budget, :file

  	validates :name, :email, :message, :presence => true
  	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

end
