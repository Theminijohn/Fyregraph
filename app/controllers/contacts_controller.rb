class ContactsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = current_user.contacts.build
  end

  def edit
  end

  def create
    @project = Project.find(params[:project_id])
    @contact = current_user.contacts.build(contact_params)
    @contact.project_id = @project.id

    if @contact.save
      redirect_to @project, notice: 'Contact was sucessfully created.'
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was sucessfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @contact.destroy
    redirect_to @project, notice: 'Contact was sucessfully destroyed.'
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :mobile_phone, :home_phone)
    end
end
