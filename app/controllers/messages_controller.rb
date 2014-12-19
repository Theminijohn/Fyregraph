class MessagesController < ApplicationController

  before_filter :load_messagable

  def index
  end

  def new
    @message = @messagable.message.new
  end

  def create
    @message = @messagable.messages.new(params[:message])
    if @message.save
      redirect_to [@messagable, :message], notice: 'Message Created'
    else
      redirect_to root_path
    end
  end

private
  
  def load_messagable
    resource, id = request.path.split('/')[1,2]
    @messagable = resource.singularize.classify.constantize.find(id)
    # klass = [User, Contact].detect { |c| params["#{c.name.underscore}_id"] }
    # @messagable = klass.find(params["#{klass.name.undersore}_id"])
  end

end