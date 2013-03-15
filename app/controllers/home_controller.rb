class HomeController < ApplicationController
  respond_to :html, :json
  before_filter :portfolio, :only => [:index]
  before_filter :clients, :only => [:index]
  
  def index

  end
  
  def about
    @team = User.find(:all)
  end
  
  def services
    
  end
  
  def portfolio
      @portfolios = Portfolio.find(:all)
  end

  def clients
    @clients = Client.find(:all)
  end

  def get_now
    @getnow = Contact.new
    if request.post?


      @getnow = Contact.new(params[:contact])
      if @getnow.save 
        @getnow = Contact.new 
        flash[:notice] = "Message successfully created!"
      else 
        render :action => "get_now"      
      end
    end
  end
  
  def contact
    @contact = Contact.new
    if request.post?
      @contact = Contact.new(params[:contact])
      if @contact.save 
        @contact = Contact.new 
        flash[:notice] = "Message successfully created! "
      else 
        render :action => "contact"      
      end
    end
  end
end
