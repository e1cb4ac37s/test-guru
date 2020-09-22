class Admin::GistsController < Admin::BaseController
  def index
    @gists = gist_hashes(GistsService.new.gists)
  end

  private

  def gist_hashes(gists)
    gists.map do |gist|
      _, title, email = gist.description.split(':::')
      {
        email: email,
        url: gist.html_url,
        title: title
      }
    end
  end
end
