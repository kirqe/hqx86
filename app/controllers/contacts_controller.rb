class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    @contact.request = request    
    respond_to do |format|
      if @contact.deliver
        format.html { redirect_to root_path, notice: "Thank you for your message."}
      else
        format.html {render :new, error: "There was a problem with sending your message."}
      end
    end
  end
  
  
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message, :request_type, :budget, :purpose, :build_info, :nickname)
  end
  
end