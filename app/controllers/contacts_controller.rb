class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thanks for your message!'
    else
      render :new
      flash.now[:error] = 'There was a problem with sending your message.'
    end
  end
end
