class Admin::BadgesController < Admin::BaseController
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
    form = params[:badge]
    arg = BadgeService::HASH[form[:rule]][:arg]
    @badge = Badge.new(
      name: form[:name],
      image: form[:image],
      description: form[:description],
      rule: form[:rule],
      rule_arg: form[arg]
      )
    if @badge.save
      redirect_to admin_badges_path
    else

    end
  end

  def edit; end

  def update; end

  def destroy; end
end
