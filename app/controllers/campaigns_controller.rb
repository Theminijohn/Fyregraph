class CampaignsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def edit
  end

  def create

    @project = Project.find(params[:project_id])
    @campaign = current_user.campaigns.build(campaign_params)
    @campaign.project_id = @project.id

    # Send Individual Messages to Contacts
    @campaign.send_campaign

    if @campaign.save
      redirect_to @project, notice: 'Campaign was successfully send!'
    else
      render :new
    end
  end

  def update
    @campaign.update(campaign_params)
  end

  def destroy
    @campaign.destroy
    redirect_to @project
  end

  private
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def campaign_params
      params.require(:campaign).permit(:name, :body, :references, :references)
    end
end
