class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit update]

  def index
    @badges = Badge.all
  end

  def show
    @badge = Badge.find_by(params[:id])
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(create_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(update_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def update_params
    params.require(:badge).permit(:name, :image, :description)
  end

  def create_params
    badge_params = params.require(:badge)
    _params = badge_params.permit(:name, :image, :description, :rule)
    arg = BadgeService::HASH[_params[:rule]][:arg]
    _params.merge(rule_arg: badge_params[arg])
  end
end
