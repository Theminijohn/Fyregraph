class CampaignsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  def index
    @campaigns = Campaign.all
    respond_with(@campaigns)
  end

  def show
    respond_with(@campaign)
  end

  def new
    @campaign = Campaign.new
    respond_with(@campaign)
  end

  def edit
  end

  def create

    # Identify Project
    @project = Project.find(@campaign.project_id)

    # Create Campaign
    @campaign = current_user.campaigns.build(campaign_params)

    # Send Twilio Request

    # Catch exceptions

    if @campaign.save
      redirect_to @project, notice: 'Campaign was successfully send!'

    else
      render :back
    end
  end

  def update
    @campaign.update(campaign_params)
    respond_with(@campaign)
  end

  def destroy
    @campaign.destroy
    respond_with(@campaign)
  end

  private
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def campaign_params
      params.require(:campaign).permit(:name, :body, :references, :references)
    end
end
