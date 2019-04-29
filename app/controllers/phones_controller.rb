class PhonesController < ApplicationController
    before_action :set_contact

    # GET /contacts/1/phones
    def show
        render json: @contact.phones
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
        @contact = Contact.find(params[:contact_id])

end