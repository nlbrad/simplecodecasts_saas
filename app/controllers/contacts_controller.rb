class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
            if @contact.save
                redirect_to new_contacts_path, notice: "Message sent"
            else
                redirect_to new_contacts_path, notice: "Error occured"
            end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end